defmodule Arweave.WalletsTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  import Arweave.Wallets

  doctest Arweave.Wallets

  @client Arweave.Client.new()

  setup_all do
    HTTPoison.start()
  end

  test "get_balance/3" do
    use_cassette "wallets#get_balance" do
      {_, balance, _} = get_balance(@client, "abc123")
      assert balance == 0
    end
  end

  test "get_last_transaction/3" do
    use_cassette "wallets#get_last_transaction" do
      {_, tx_id, _} = get_last_transaction(@client, "abc123")
      assert tx_id == "7SRpf0dWDqN4hbnCMPkdg02u_tzyMBtqwjDBy3EU9dg"
    end
  end

end
