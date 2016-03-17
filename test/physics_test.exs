defmodule PhysicsTest do
  use ExUnit.Case
  alias Calcs
  alias Physics.Rocketry


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

  test "converts m to km" do
    assert Calcs.to_km(1000) == 1
  end

  test "calculate_earths_velocity" do
    assert  Rocketry.escape_velocity(:earth) == 11.2
  end

  test "test orbital velocity at 100km" do
    assert_in_delta Rocketry.orbital_accelaration(100) , 9.51, 0.1
  end

end
