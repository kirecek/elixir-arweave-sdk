defmodule ElixirArweaveSdkTest do
  use ExUnit.Case
  doctest ElixirArweaveSdk

  test "greets the world" do
    assert ElixirArweaveSdk.hello() == :world
  end
end
