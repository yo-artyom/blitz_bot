defmodule BlitzBot.Message do
  use Ecto.Schema
  alias BlitzBot

  schema "message" do
    belongs_to :user, BlitzBot.User
    belongs_to :chat, BlitzBot.Chat
  end
end
