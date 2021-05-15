defmodule CrawlQueuer do
    def update_prices do
        IO.puts("Starting spider")
        Crawly.Engine.start_spider(StaplesSpider)
    end
end
