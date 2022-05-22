defmodule RspamdExTest do
  use ExUnit.Case
  doctest RspamdEx

  test "greets the world" do
    assert RspamdEx.hello() == :world
  end
end
