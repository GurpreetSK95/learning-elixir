defmodule Cards do
  def create_deck do
    cards = ["Ace", "King", "Queen", "Ten", "Nine", "Eight", "Seven"]
    suits = ["Diamonds", "Spades", "Hearts", "Clubs"]
    for card <- cards, suit <- suits do
      "#{card} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    file = :erlang.term_to_binary(deck)
    File.write(file_name, file)
  end

  def load(file_name) do
    case File.read(file_name) do
      {:ok, file}       -> :erlang.binary_to_term(file)
      {:error, _status} -> "Not found"
    end
  end
end
