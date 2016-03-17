defmodule Calcs do
  def to_km(val) do
    val / 1000
  end

  def to_m(val) do
    val * 1000
  end

  def square_root(val) do
    :math.sqrt(val)
  end

  def to_nearest_tenth(val) do
    Float.ceil(val, 1)
  end

  def squared(val) do
    val * val
  end

  def cubed(val) do
    val * val * val
  end

  def seconds_to_hours(seconds) do
    seconds / 3600 |> to_nearest_tenth
  end


end
