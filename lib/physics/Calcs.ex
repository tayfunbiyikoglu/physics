defmodule Physics.Calcs do
  def convert_to_km(val) do
    val / 1000
  end

  def to_nearest_integer(val) do
    Float.ceil(val, 1)
  end
end
