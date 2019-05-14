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
end
