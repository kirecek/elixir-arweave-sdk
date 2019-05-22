defmodule Arweave.NetworkTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Arweave.Network

  doctest Arweave.Network

  @client Arweave.Client.new()

  setup_all do
    HTTPoison.start()
  end

  test "info/1" do
    use_cassette "network#info" do
      {_, %{"network" => network, "current" => current}, _} = info(@client)
      assert network == "arweave.N.1"
      assert current == "o8ahQ55Omd7Fdi4UgGP82bD2-TZ66JYY33NzGyvpLL3_V3wCmsq8NJmnkJl1p_ew"
    end
  end

  test "peers/1" do
    use_cassette "node#peers" do
      {_, peers, _} = peers(@client)
      assert length(peers) == 2
    end
  end

end
