defmodule BlitzBot.User do
  use Ecto.Schema

  schema "user" do
    field :user_id, :integer
    field :first_name, :string
    field :last_name, :string
    field :username, :string
  end
end
