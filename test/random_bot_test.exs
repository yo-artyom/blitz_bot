defmodule RandomBotTest do
  use ExUnit.Case
  doctest RandomBot

  test "greets the world" do
    assert RandomBot.hello() == :world
  end
end
