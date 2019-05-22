defmodule Arweave.Network do
  import Arweave
  alias Arweave.Client

  @doc """
  Get the list of peers that the node. Nodes can only respond with peers they currently know about,
  so this will not be an exhaustive or complete list of nodes on the network.

  https://docs.arweave.org/developers/server/http-api#network-and-node-state
  """
  @spec peers(Client.t()) :: Arweave.response()
  def peers(client \\ %Client{}) do
    get("peers", client)
  end

  @doc """
  Get the current network information including height, current block, and other properties.

  https://docs.arweave.org/developers/server/http-api#network-and-node-state
  """
  @spec info(Client.t()) :: Arweave.response()
  def info(client \\ %Client{}) do
    get("info", client)
  end

end
