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

  @doc """
  Get a single field from a transaction.
  ## Example
      Arweave.Transactions.get_field "BNttzDav3jHVnNiV7nYbQv-GY0HQ-4XXsdkE5K9ylHQ" "jUcuEDZQy2fC6T3fHnGfYsw0D0Zl4NfuaXfwBOLiQtA"
      Arweave.Transactions.get_field client, "BNttzDav3jHVnNiV7nYbQv-GY0HQ-4XXsdkE5K9ylHQ" "jUcuEDZQy2fC6T3fHnGfYsw0D0Zl4NfuaXfwBOLiQtA"
  More info at: https://docs.arweave.org/developers/server/http-api#transactions
  """
  @spec get_field(Client.t(), binary, binary) :: Arweave.response()
  def get_field(client \\ %Client{}, id, field) do
    get("tx/#{id}/#{field}", client)
  end

  @doc """
  Get the raw base64 decoded data from a transaction.
  ## Example
      Arweave.Transactions.get_data "BNttzDav3jHVnNiV7nYbQv-GY0HQ-4XXsdkE5K9ylHQ" "html"
      Arweave.Transactions.get_data client, "BNttzDav3jHVnNiV7nYbQv-GY0HQ-4XXsdkE5K9ylHQ" "html"
  More info at: https://docs.arweave.org/developers/server/http-api#transactions
  """
  @spec get_data(Client.t(), binary, binary) :: Arweave.response()
  def get_data(client \\ %Client{}, id, extension) do
    get("tx/#{id}/data.#{extension}", client)
  end

end
