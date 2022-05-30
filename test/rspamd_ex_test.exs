defmodule RspamdExTest do
  use ExUnit.Case
  doctest RspamdEx.Client

  test "Can scan a basic message and return the struct" do
    message = """
    foobar
    """

    assert {:ok, %RspamdEx.Client.ScanResults{}} = RspamdEx.Client.scan_message(message)
  end

  test "Can scan files for rspamd test patterns" do
    results = ["add_header.eml"] |> Enum.map(fn file -> "#{File.cwd!}/test/sample_emails/#{file}" end) |> Enum.map(fn filepath ->
      {:ok, results} = RspamdEx.Client.scan_file(filepath)
      results.action == "add header"
    end)
    assert Enum.all?(results)
  end
end
