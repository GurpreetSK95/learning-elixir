defmodule Cards do
  @moduledoc """
    Contains methods to create a deck and perform operations on it.
  """

  @doc """
    Creates a deck of cards from the specified cards and suits.
  """
  def create_deck do
    cards = ["Ace", "King", "Queen", "Ten", "Nine", "Eight", "Seven"]
    suits = ["Diamonds", "Spades", "Hearts", "Clubs"]
    for card <- cards, suit <- suits do
      "#{card} of #{suit}"
    end
  end

  @doc """
    Shuffle the give deck of cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Returns whether the deck contains the given card or not.
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Splits the deck into two parts of size `hand-size` and deck - `hand-size`.
  """
  def split(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves the deck to given absolute path.
  """
  def save(deck, path) do
    file = :erlang.term_to_binary(deck)
    File.write(path, file)
  end

  @doc """
    Load the file from given absolute path.
  """
  def load(path) do
    case File.read(path) do
      {:ok, file}       -> :erlang.binary_to_term(file)
      {:error, _status} -> "Not found"
    end
  end

  @doc """
    Deal a hand of given size.
  """
  def deal(hand_size) do
    create_deck()
      |> shuffle()
      |> split(hand_size)
  end
end
