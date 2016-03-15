defmodule Physics.Rocketry do
  alias Physics.Calcs

  def calculate_escape(%{mass: mass, radius: radius}) do
      g_constant = 6.67e-11
      2 * g_constant * mass / radius
      |> :math.sqrt
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> Calcs.convert_to_km
      |> Calcs.to_nearest_integer
  end

  def escape_velocity(:earth) do
    %{mass: 5.972e24, radius: 6.371e6}
      |> escape_velocity
  end

end
