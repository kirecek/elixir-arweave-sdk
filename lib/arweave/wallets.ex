defmodule Arweave.Wallets do
  import Arweave
  alias Arweave.Client

  @doc """
  Get the ballance for a given wallet. Unknown wallet addresses will simply return 0.

  More info at: https://docs.arweave.org/developers/server/http-api#wallets
  """
  @spec get_balance(Client.t(), binary) :: Arweave.response()
  def get_balance(client \\ %Client{}, address) do
    get("wallet/#{address}/balance", client)
  end

  @doc """
  Get the last outgoing transaction for the given wallet address.

  More info at: https://docs.arweave.org/developers/server/http-api#wallets
  """
  @spec get_last_transaction(Client.t(), binary) :: Arweave.response()
  def get_last_transaction(client \\ %Client{}, address) do
    get("wallet/#{address}/last_tx", client)
  end

end
