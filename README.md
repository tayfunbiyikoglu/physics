# Physics

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add physics to your list of dependencies in `mix.exs`:

        def deps do
          [{:physics, "~> 0.0.1"},
          {:timex, "~> 1.0.0-rc3"}
          ]
        end

  2. Ensure physics is started before your application:

        def application do
          [applications: [:physics,:logger, :tzdata]]
        end
