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

  def scan_file(filename) do
    if File.exists?(filename) do
      GenServer.call(__MODULE__, {:scan_file, filename})
    else
      Logger.error(["File ", filename, " doesn't appear to exist."])
      {:error, :enoent}
    end
  end

  def handle_call({:scan, message}, _from, state) when is_binary(message) do
    hash = :crypto.hash(:sha, message) |> Base.url_encode64() |> String.slice(0, 20)
    path = Keyword.get(state, :path)
    file_path = [path, hash] |> Enum.join("/")

    case write_file(message, file_path) do
      :ok ->
        scan_path(file_path, state)

      {:error, error} ->
        Logger.error(["Unable to write file due to ", inspect(error)])
        {:reply, {:error, error}, state}
    end
  end

  def handle_call({:scan_file, filename}, _from, state) do
    scan_path(filename, state)
  end

  defp scan_path(filename, state) do
    Logger.debug(["Scanning file at path ", filename])
    with {encoded_json, 0} <- run_command(state, filename),
         {:ok, scan_results} <- Jason.decode(encoded_json, keys: :atoms),
         :ok <- delete_file(filename, Keyword.get(state, :delete)) do
      {:reply, {:ok, struct(RspamdEx.Client.ScanResults, scan_results)}, state}
    else
      {:error, error} ->
        Logger.error(["Unable to open file path due to ", inspect(error)])
        {:reply, {:error, error}, state}

      {out, n} when is_integer(n) and is_binary(out) ->
        Logger.error(["rspamc exited with error code ", n, "and output ", out])
        {:reply, {:error, :rspamc_error}, state}
    end
  end

  defp delete_file(path, delete_enabled) do
    if delete_enabled do
      File.rm(path)
    else
      :ok
    end
  end

  defp run_command(state, filepath) do
    args = if Keyword.has_key?(state, :password) do
      [
        "--json",
        "--password",
        Keyword.get(state, :password),
        "--connect",
        "#{Keyword.get(state, :host)}:#{Keyword.get(state, :port)}",
        "symbols",
        filepath
      ]
    else
      [
        "--json",
        "--connect",
        "#{Keyword.get(state, :host)}:#{Keyword.get(state, :port)}",
        "symbols",
        filepath
      ]
    end
    System.cmd(Keyword.get(state, :executable), args)
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
