defmodule PointTest do
  use ExUnit.Case

  test "New point" do
    assert Point.new(6, 6) == {6, 6}
  end
  test"Move point down" do
    assert Point.move_down({1, 2}) == {2, 2}
  end

  test "Move point left" do
    assert Point.move_left({1, 2}) == {1, 1}
  end

  test "Move point right" do
    assert Point.move_right({1, 3}) == {1, 4}
  end
end
