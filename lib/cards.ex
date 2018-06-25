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
end
