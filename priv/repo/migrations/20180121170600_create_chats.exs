defmodule RandomBot.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_id, :integer
      add :first_name, :string
      add :last_name, :string
      add :username, :string
    end
    create index :users,  :user_id
  end
end
