defmodule RandomBot.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :text, :text
      add :file_id, :string
      add :file_type, :string
      add :chat_id, references(:chats)
      add :user_id, references(:users)
    end
  end
end
