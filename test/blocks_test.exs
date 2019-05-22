defmodule Arweave.BlocksTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Arweave.Blocks

  doctest Arweave.Blocks

  @client Arweave.Client.new()

  setup_all do
    HTTPoison.start()
  end

  test "find_balance/2" do
    use_cassette "blocks#find" do
      {_, %{"hash" => hash}, _} = find(@client, "AAAAABXiIEay0l1jH9ibJWKNvCUlxVQrQiZGVyW-4MuDX6Pn_uq6-oOGk3kwAxRa")
      assert hash == "AAAAABXiIEay0l1jH9ibJWKNvCUlxVQrQiZGVyW-4MuDX6Pn_uq6-oOGk3kwAxRa"
    end
  end

end
