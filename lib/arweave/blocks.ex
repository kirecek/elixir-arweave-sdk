defmodule Arweave.Blocks do
  import Arweave
  alias Arweave.Client

  @doc """
  Get a block by its hash (idep_hash).

  More info at: https://docs.arweave.org/developers/server/http-api#blocks
  """
  @spec find(Client.t(), binary) :: Arweave.response()
  def find(client \\ %Client{}, block_hash) do
    get("block/hash/#{block_hash}", client)
  end

end
