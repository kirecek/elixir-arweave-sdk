defmodule ArweaveTest do
  use ExUnit.Case
  import Arweave

  doctest Arweave

  setup_all do
    :meck.new(JSX, [:no_link])

    on_exit(fn ->
      :meck.unload(JSX)
    end)
  end

  test "process response on a 200 response" do
    assert {200, "json", _} =
      process_response(%HTTPoison.Response{status_code: 200, headers: %{}, body: "json"})

    assert :meck.validate(JSX)
  end

  test "process response on a non-200 response" do
    assert {404, "json", _} =
      process_response(%HTTPoison.Response{status_code: 404, headers: %{}, body: "json"})

    assert :meck.validate(JSX)
  end

  test "process_response_body with an empty body" do
    assert process_response_body("") == nil
  end

  test "process_response_body with content" do
    :meck.expect(JSX, :decode!, 1, :decoded_json)
    assert process_response_body("json") == :decoded_json
  end
end
