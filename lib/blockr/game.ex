defmodule Blockr.Game do

  alias Blockr.Game.{Tetromino, Board}

  def left(board) do
    tetro = Tetromino.left(board.tetro)
    replace_unless_collides(board, tetro)
  end

  def right(board) do
    tetro = Tetromino.right(board.tetro)
    replace_unless_collides(board, tetro)
  end

  def turn(board) do
    tetro = Tetromino.rotate_right_90(board.tetro)
    replace_unless_collides(board, tetro)
  end

  def fall(board) do
    tetro = Tetromino.fall(board.tetro)

    if collides?(board, tetro) do
      crash(board)
    else
     %{board | tetro: tetro}
    end

  end

  def crash(board) do
    board
    |> Board.detach_tetro()
    |> Board.new_tetro()
  end

  def replace_unless_collides(board, tetro) do

    if not collides?(board, tetro) do
      %{board | tetro: tetro}
    else
      board

    end
  end


  def collides?(board, tetro) do
    set =
      tetro
      |> Tetromino.to_group()
      |> MapSet.new()

    intersection = MapSet.intersection(set, board.points)

    MapSet.size(intersection) > 0
  end

end
