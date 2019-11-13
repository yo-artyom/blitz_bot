defmodule BlitzBot.MessageListener do
  use GenServer

  @moduledoc """
  Server that trying to fetch messages every setted period of time.
  If messages sucsessfully fetched creates a new Task (process) with message handler.
  """

  alias BlitzBot.MessageFetcher
  alias BlitzBot.MessageHandler

  def start_link() do
    GenServer.start_link(__MODULE__, {}, name: __MODULE__)
  end

  @impl true
  def init(state) do
    listen()

    {:ok, state}
  end

  @impl true
  def handle_info(:listen, {}) do
    MessageFetcher.get
    |> Enum.each(fn(message) -> spawn_handler_process(message) end)

    listen()
    {:noreply, {}}
  end

  def listen() do
    Process.send_after(self(), :listen, 500)
  end

  defp spawn_handler_process(message) do
    Task.start(MessageHandler, :answer, [message])
  end
end
