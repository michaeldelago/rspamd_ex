defmodule RspamdExTest do
  use ExUnit.Case
  doctest RspamdEx.Client

  test "Can scan a basic message and return the struct" do
    message = """
    foobar
    """

    assert {:ok, %RspamdEx.Client.ScanResults{}} = RspamdEx.Client.scan_message(message)
  end
end
