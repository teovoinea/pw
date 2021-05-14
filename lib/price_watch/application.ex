defmodule PriceWatch.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: PriceWatch.Worker.start_link(arg)
      # {PriceWatch.Worker, arg}
    ]
    Crawly.Engine.start_spider(StaplesSpider)

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PriceWatch.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
