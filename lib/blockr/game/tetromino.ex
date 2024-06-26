defmodule Blockr.Game.Tetromino do
  alias Blockr.Game.{Point, Group}

  defstruct [
    name: :i,
    location: {0, 0},
    rotation: 0,
  ]

  def new do
    %__MODULE__{}
  end

  def new(options) when is_list(options) do
    __struct__(options)
  end

  def new(name) do
    %__MODULE__{name: name}
  end

  def new_random() do
    # new tetro in the top middle with a random shape
  end

  def left(tetro) do
    %{tetro | location: Point.move_left(tetro.location)}
  end

  def right(tetro) do
    %{tetro | location: Point.move_right(tetro.location)}
  end

  def fall(tetro) do
    %{tetro | location: Point.move_down(tetro.location)}
  end


  def rotate_right_90(tetro) do
    %{tetro | rotation: rem(tetro.rotation + 90, 360)}
  end

  # we can do in this way also
  # def rotate_right_90(%{rotation: 270}= tetro) do
  #   %{tetro | rotation: 0}
  # end

  # def rotate_right_90(tetro) do
  #   %{tetro | rotation: tetro.rotation + 90}
  # end

  def to_group(tetro) do
    case tetro.name do
      :i -> [{1, 2}, {2, 2}, {3, 2}, {4, 2}]
      :l -> [{1, 2}, {2, 2}, {3, 2}, {3, 3}]
      :j -> [{1, 2}, {2, 2}, {3, 2}, {3, 1}]
      :o -> [{1, 2}, {1, 3}, {2, 2}, {2, 3}]
      :t -> [{1, 2}, {2, 2}, {2, 3}, {3, 2}]
      :s -> [{2, 3}, {2, 4}, {3, 2}, {3, 3}]
      :z -> [{2, 2}, {2, 3}, {3, 3}, {3, 4}]
    end
    |> Group.rotate(tetro.rotation)
    |> Group.move_to(tetro.location)

  end

end
