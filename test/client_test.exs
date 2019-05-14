defmodule Arweave.ClientTest do
  use ExUnit.Case
  import Arweave.Client

  doctest Arweave.Client

  test "default endpoint" do
    client = new()
    assert client.endpoint == "http://arweave.net:1984/"
  end

  test "custom endpoint" do
    expected = "https://example.com/"

    client = new("https://example.com/")
    assert client.endpoint == expected

    # when tailing '/' is missing
    client = new("https://example.com")
    assert client.endpoint == expected
  end
end
