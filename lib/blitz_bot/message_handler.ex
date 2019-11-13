defmodule BlitzBot.MessageHandler do
  alias BlitzBot.RandomCardPicker

  @moduledoc """
  Module responsible for parsing message and handling the response.
  """

  def answer(update) do
    cond do
      String.match?(update.message.text, ~r/\/?start/) -> start_message(update)
      String.match?(update.message.text, ~r/^[1-6]$/) -> send_cards(update)
      true -> true
    end
  end

  def start_message(update) do
    str = "Hello. Currently I can:\nSend a card. Tell me how many ( 1-6 ):"
    Nadia.send_message(update.message.chat.id, str)
  end

  def send_cards(update) do
    number = update.message.text |> String.to_integer

    send_media_group(update.message.chat.id, RandomCardPicker.ids(number))
  end

  defp send_media_group(chat_id, ids) do
    media = Poison.encode!(build_photo_array(ids))
    Nadia.API.request("sendMediaGroup", [chat_id: chat_id, media: media])
  end

  defp build_photo_array(ids) do
    Enum.map(ids, fn(id) -> %{type: "photo", media: id} end)
  end
end
