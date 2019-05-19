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

  @doc """
  Calculate the minimum fee (reward) for a transaction of a specific size, and possibly to a specific address.
  More info at: https://docs.arweave.org/developers/server/http-api#transactions
  """
  @spec get_price(Client.t(), binary, binary) :: Arweave.response()
  def get_price(client \\ %Client{}, bytes, target) do
    get("tx/#{bytes}/#{target}", client)
  end

  @spec get_price(Client.t(), binary) :: Arweave.response()
  def get_price(client \\ %Client{}, bytes \\ "0") do
    get("tx/#{bytes}", client)
  end

  @doc """
  Submit a new transaction to the network.

  Required values for `body`:

  * [id: "The transaction ID"]
  * [last_tx: "The last outgoing transaction ID from the sending wallet."]
  * [owner: "The full RSA modulus value for the sending wallet, base64 URL encoded. The modulus is the n value from a JWK."]
  * [tags: "List of tags to identify transaction"]
  * [target: "The recipient address (if sending AR to another wallet). Use an empty string for data transactions."]
  * [quantity: "The amount in winston to transfer to the target wallet. Use an empty string for data transactions."]
  * [data: "The data to be uploaded, base64 URL encoded. Use an empty string if not required."]
  * [reward: "The transaction fee."]
  * [signature: "The transaction signature, base64 URL encoded."]

  More info at: https://docs.arweave.org/developers/server/http-api#transactions
  """
  @spec create(Client.t(), map) :: Arweave.response()
  def create(client \\ %Client{}, body) do
    post("tx", client, body)
  end
end
