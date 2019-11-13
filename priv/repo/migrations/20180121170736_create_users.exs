defmodule RandomBot.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :chat_id, :integer
      add :title, :string
      add :type, :string
      add :username, :string
    end

    create index :chats,  :chat_id
  end
end
