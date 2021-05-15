defmodule CrawlQueuer do
    def update_prices do
        IO.puts("Starting spider")
        Crawly.Engine.start_spider(StaplesSpider)

        IO.puts("Sending email")
        PriceWatch.Email.sale_email()
        |> PriceWatch.Mailer.deliver_now!()
    end
end
