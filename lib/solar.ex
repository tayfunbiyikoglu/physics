defmodule Solar do
  def power(%{classification: :M, scale: scale}),  do: 10 * scale
  def power(%{classification: :X, scale: scale}),  do: 1000 * scale
  def power(%{classification: :C, scale: scale}),  do: 1 * scale

  def no_eva(flares) do
    Enum.filter flares, fn(flare) ->
      power(flare) > 1000
     end
  end

  def deadliest(flares) do
    flares
      |> Enum.map(&(power(&1)))
      |> Enum.max
  end

  def total_flare_power(flares) do
    flares
      |> Enum.map(&(power(&1)))
      |> Enum.sum
  end

  def total_flare_power_Reduce(flares) do
      flares
        |> (Enum.reduce 0, fn flare,total -> total + power(flare) end)
  end

  def total_flare_power_comprehension(flares) do
    (for flare <- flares, do: power(flare))
      |> Enum.sum
  end

  def flare_list(flares) do
    Enum.map flares, fn flare ->
        p = power(flare)
        { :power, p, :is_deadly, p > 1000 }
      end
  end
end
