defmodule ArweaveTest do
  use ExUnit.Case
  doctest Arweave

  test "greets the world" do
    assert Arweave.hello() == :world
  end
end
