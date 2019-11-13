defmodule BlitzBot.MessageFetcher do
  use GenServer

  @moduledoc """
  Server that fetch new batch of incoming messages.
  Keeps the offset_id as a state.
  offset_id is used for offseting next messages batch.
  """

  def start_link(offset_id \\ 0) do
    GenServer.start_link(__MODULE__, offset_id, name: __MODULE__)
  end

  def get do
    GenServer.call(__MODULE__, :get)
  end

  @impl true
  def init(state) do
    {:ok, state }
  end

  @impl true
  def handle_call(:get, _from, offset_id) do
    {:ok, updates } = Nadia.get_updates(offset: offset_id, limit: 100)

    received_last_message_id =
      case updates do
        [] -> 0
        _ -> updates |> List.last |> Map.get(:update_id, 0)
      end

    {:reply, updates, received_last_message_id + 1}
  end
end
