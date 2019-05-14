defmodule Arweave do
  use HTTPoison.Base
  alias Arweave.Client

  @user_agent [{"User-agent", "elixir-arweave"}]

  @type response ::
    {:ok, :jsx.json_term(), HTTPoison.Response.t()}
    | {integer, any, HTTPoison.Response.t()}

  @spec process_response_body(binary) :: term
  def process_response_body(""), do: nil
  def process_response_body(body), do: JSX.decode!(body)

  @spec process_response(HTTPoison.Response.t()) :: response
  def process_response(%HTTPoison.Response{status_code: status_code, body: body} = resp),
    do: {status_code, body, resp}

  def _request(method, url, body \\ "") do
    json_request(method, url, body, @user_agent)
  end

  @spec json_request(atom, binary, any, keyword, keyword) :: response
  def json_request(method, url, body \\ "", headers \\ [], options \\ []) do
    raw_request(method, url, JSX.encode!(body), headers, options)
  end

  def raw_request(method, url, body \\ "", headers \\ [], options \\ []) do
    method
    |> request!(url, body, headers, options)
    |> process_response
  end

  @spec post(binary, Client.t(), any) :: response
  def post(path, client, body \\ "") do
    _request(:post, url(client, path), body)
  end

  @spec post(binary, Client.t(), any) :: response
  def get(path, client, body \\ "") do
    _request(:post, url(client, path), body)
  end

  @spec url(client :: Client.t(), path :: binary) :: binary
  defp url(_client = %Client{endpoint: endpoint}, path) do
    endpoint <> path
  end
end
