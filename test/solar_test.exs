defmodule SolarTest do
  use ExUnit.Case
  use Timex

  setup do
    flares = [
      %{classification: :M, scale: 2.1, date: Date.from({1859, 8, 29})},
      %{classification: :X, scale: 5.8, date: Date.from({2015, 1, 12})},
      %{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
      %{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
      %{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
      %{classification: :X, scale: 72, date: Date.from({2012, 7, 23})},
      %{classification: :X, scale: 45, date: Date.from({2003, 11, 4})},
    ]
    {:ok, data: flares}
  end

  test "We have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end

  test "calculates power correct for classification M", %{data: flares} do
    assert Solar.power(List.first(flares)) == 21
  end
  test "calculates power correct for classification X", %{data: flares} do
    assert Solar.power(List.last(flares)) == 45000
  end

  test "no_eva test", %{data: flares} do
    no_eva = Solar.no_eva(flares)
    assert length(no_eva) == 3
  end

  test "calculates the power of deadliest flare", %{data: flares} do
    assert Solar.deadliest(flares) == 72000
  end

  test "calculates total flare power", %{data: flares} do
    assert Solar.total_flare_power(flares) == 123674.7
  end

  test "calculates total flare power Reduce", %{data: flares} do
    assert Solar.total_flare_power_Reduce(flares) == 123674.7
  end
  test "calculates total flare power for comprehension", %{data: flares} do
    assert Solar.total_flare_power_comprehension(flares) == 123674.7
  end
  test "lists flares with power and deadliness", %{data: flares} do
    assert Solar.flare_list(flares) == [
      {:power, 21.0, :is_deadly, false},
      {:power, 5.8e3, :is_deadly, true},
      {:power, 12.0, :is_deadly, false},
      {:power, 3.2, :is_deadly, false},
      {:power, 836.0, :is_deadly, false},
      {:power, 2.5, :is_deadly, false},
      {:power, 72000, :is_deadly, true},
      {:power, 45000, :is_deadly, true}
          ]
  end
end
