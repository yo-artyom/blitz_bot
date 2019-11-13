defmodule BlitzBot.Chat do
  use Ecto.Schema

  schema "chat" do
    field :chat_id, :integer
    field :title, :string
    field :type, :string
    field :username, :string
  end
end
