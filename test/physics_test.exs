defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "String equality" do
    assert "tayfun" == "tayfun"
  end

  test "String concat" do
    assert "tayfun" <> "biyikoglu" == "tayfunbiyikoglu"
  end

  test "resuce_test" do
    sum = [1,2,3,4,5] |> Enum.reduce(fn el, acc -> el + acc end)
    assert 15 == sum
  end

  test "resuce_initial" do
    sum = [1,2,3,4,5] |> Enum.reduce(3, fn el, acc -> el + acc end)
    assert 18 == sum
  end

end
