defmodule Arweave.Client do
  defstruct endpoint: "http://arweave.net:1984/"

  @type t :: %__MODULE__{endpoint: binary}

  @spec new() :: t
  def new(), do: %__MODULE__{}

  @spec new(binary) :: t
  def new(endpoint) when is_binary(endpoint) do
    endpoint =
      if String.ends_with?(endpoint, "/") do
        endpoint
      else
        endpoint <> "/"
      end

    %__MODULE__{endpoint: endpoint}
  end
end
