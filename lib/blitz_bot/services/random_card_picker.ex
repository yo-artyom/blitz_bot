defmodule BlitzBot.RandomCardPicker do
  @moduledoc """
  Module returns random image from folder or id(s) of previously uploaded to telegram set of images
  """

  def ids(number) do
    {:ok, images} = File.read(File.cwd! <> "/public/id_big")

    images
    |> String.split
    |> Enum.take_random(number)
  end

  defp random_card_path do
    File.cwd! <> "/public" <> "*.jpg"
    |> Path.wildcard
    |> Enum.random
  end
end
