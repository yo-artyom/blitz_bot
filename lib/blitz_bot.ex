defmodule BlitzBot do
  alias BlitzBot.MessageFetcher
  alias BlitzBot.MessageListener

  @moduledoc """
  Documentation for BlitzBot.
  """

  def start(_t, _args) do
    # import Supervisor.Spec

    children = [
      %{
        id: MessageFetcher,
        start: {MessageFetcher, :start_link, []}
      },
      %{
        id: MessageListener,
        start: {MessageListener, :start_link, []}
      }
    ]

    opts = [strategy: :one_for_one, name: BlitzBot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
    Command called by escript
  """
  def main(args) do
    BlitzBot.start(nil, args)
  end
end
