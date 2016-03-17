defmodule Physics.Rocketry do

  import Calcs
  import Planets
  import Physics.Laws

  def escape_velocity(:earth) do
    earth
      |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_speed(planet, height) do
    newtons_gravitational_constant * planet.mass / orbital_radius(height)
      |> square_root
  end

  defp orbital_speed(height) do
    orbital_speed(earth, height)
  end

  defp orbital_radius(planet, height) do
    planet.radius + (height |> to_m)
  end

  defp orbital_radius(height) do
    orbital_radius(earth, height)
  end

  def orbital_accelaration(height) do
    (orbital_speed(height) |> squared) / orbital_radius(height)
      |> to_nearest_tenth

  end

  def orbital_term(height) do
    4 * (:math.pi |> squared) * orbital_radius(height)
        / (newtons_gravitational_constant * earth.mass )
      |> square_root
      |> seconds_to_hours

  end

end
