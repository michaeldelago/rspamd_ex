defmodule RspamdEx.Client do
  require Logger
  use GenServer

  @moduledoc """
  Module that wraps the CLI for `rspamc`, primarily in order to scan email messages
  """

  def init(args) do
    state = Application.get_all_env(:rspamd_ex) |> Keyword.merge(args)
    Logger.debug("Starting Rspamd Client")
    {:ok, state}
  end

  def start_link(args \\ []) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @spec scan_message(binary) :: {:error, any} | {:ok, RspamdEx.Client.ScanResults}
  def scan_message(message) when is_binary(message) do
    GenServer.call(__MODULE__, {:scan, message})
  end

  def handle_call({:scan, message}, _from, state) when is_binary(message) do
    hash = :crypto.hash(:sha, message) |> Base.url_encode64() |> String.slice(0, 20)
    path = Keyword.get(state, :path)
    file_path = [path, hash] |> Enum.join("/")

    with :ok <- write_file(message, file_path),
         {stdout, 0} <- run_command(state, file_path),
         encoded_json <- remove_first_line(stdout),
         {:ok, scan_results} <- Jason.decode(encoded_json, keys: :atoms),
         :ok <- delete_file(file_path, Keyword.get(state, :delete)) do
      {:reply, {:ok, struct(Rspamd.Client.ScanResults, scan_results)}, state}
    else
      {:error, error} ->
        Logger.error("Unable to open file path due to #{to_string(error)}")
        {:reply, {:error, error}, state}

      {out, n} when is_integer(n) and is_binary(out) ->
        Logger.error(["rspamc exited with error code ", n, "and output ", out])
        {:reply, {:error, :rspamc_error}, state}
    end
  end

  defp remove_first_line(string) when is_binary(string) do
    String.split(string, "\n")
    |> Enum.drop(1)
    |> Enum.join("")
  end

  defp delete_file(path, delete_enabled) do
    if delete_enabled do
      File.rm(path)
    else
      :ok
    end
  end

  defp run_command(state, filepath) do
    if Keyword.has_key?(state, :password) do
      System.cmd(Keyword.get(state, :executable), [
        "-j",
        "-P",
        Keyword.get(state, :password),
        "symbols",
        filepath
      ])
    else
      System.cmd(Keyword.get(state, :executable), [
        "-j",
        "symbols",
        filepath
      ])
    end
  end

  defp write_file(message, path) do
    with {:ok, file_pointer} <- File.open(path, [:write]),
         :ok <- IO.binwrite(file_pointer, message),
         :ok <- File.close(file_pointer) do
      :ok
    else
      error ->
        error
    end
  end
end
