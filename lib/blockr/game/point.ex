defmodule Blockr.Game.Point do

  def new(row, col) do
    # new point in a tuple
    {row, col}
  end
  def move_down({row, col}) do
    # ...move point down...
    {row+1, col}
  end

  def move_left({row, col}) do
    # ...move point left...
    {row, col-1}
  end

  def move_right({row, col}) do
    # ...move point right...
    {row, col+1}
  end

  def move_to({from_row, from_col}, {to_row, to_col}) do
    {from_row + to_row, from_col + to_col}
  end

  def swap({row, col}) do
  {col, row}
  end

  def flip_left_right({row, col}) do
  {row, 5 - col}
  end

  def flip_top_bottom({row, col}) do
  {5 - row, col}
  end

  def rotate(point, 0) do
  point
  end

  def rotate(point, 90) do
  point |> swap() |> flip_left_right()
  end

  def rotate(point, 180) do
  point |> flip_top_bottom() |> flip_left_right()
  end

  def rotate(point, 270) do
  point |> swap() |> flip_top_bottom()
  end

  def paint(point, color) do
    {point, color}
  end

end
