defmodule BlitzBot.Message do
  use Ecto.Schema
  alias BlitzBot

  schema "message" do
    belongs_to :user, User
    belongs_to :chat, Chat
  end
end
