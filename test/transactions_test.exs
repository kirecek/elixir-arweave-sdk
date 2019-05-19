defmodule Arweave.TransactionsTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Arweave.Transactions

  doctest Arweave.Transactions

  @client Arweave.Client.new()

  setup_all do
    HTTPoison.start()
  end

  test "find/2" do
    use_cassette "transactions#find" do
      {_, %{"id" => id}, _} = find(@client, "0")
      assert id == "0"
    end
  end

  test "get_field/3" do
    use_cassette "transactions#get_field" do
      {_, resp, _} = get_field(@client, "0", "0")
      assert resp == 0
    end
  end

  test "get_data/3" do
    use_cassette "transactions#get_data" do
      {_, resp, _} = get_data(@client, "0", "html")
      assert resp == "<html><\/html>"
    end
  end
end
