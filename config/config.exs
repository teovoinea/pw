import Config

config :crawly,
  closespider_timeout: 10,
  concurrent_requests_per_domain: 8,
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.UniqueRequest,
    {Crawly.Middlewares.UserAgent, user_agents: ["Crawly Bot"]}
  ],
  pipelines: [
    {Crawly.Pipelines.Validate, fields: [:url, :price]},
    {Crawly.Pipelines.DuplicatesFilter, item_id: :url},
    Crawly.Pipelines.JSONEncoder,
    {Crawly.Pipelines.WriteToFile, extension: "jl", folder: "/tmp"}
  ]

config :price_watch, PriceWatch.Scheduler,
  jobs: [
    # Every minute
    {"* * * * *",      {CrawlQueuer, :update_prices, []}}
  ]

config :price_watch, PriceWatch.Mailer,
  adapter: Bamboo.PostmarkAdapter,
  api_key: {:system, "POSTMARK_API_KEY"}
