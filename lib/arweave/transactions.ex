defmodule Arweave.Transactions do
  import Arweave
  alias Arweave.Client

  @doc """
  Get a transaction by its ID.
  ## Example
      Arweave.Transactions.find "BNttzDav3jHVnNiV7nYbQv-GY0HQ-4XXsdkE5K9ylHQ"
      Arweave.Transactions.find client, "BNttzDav3jHVnNiV7nYbQv-GY0HQ-4XXsdkE5K9ylHQ"
  More info at: https://docs.arweave.org/developers/server/http-api#transactions
  """
  @spec find(Client.t(), binary) :: Arweave.response()
  def find(client \\ %Client{}, id) do
    get("tx/#{id}", client)
  end

end
