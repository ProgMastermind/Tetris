defmodule BlockrTest do
  use ExUnit.Case
  doctest Blockr

  test "greets the world" do
    assert Blockr.hello() == :helloworld
  end
end
