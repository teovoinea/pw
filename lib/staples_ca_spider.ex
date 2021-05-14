defmodule StaplesSpider do
    use Crawly.Spider
    
    alias Crawly.Utils
  
    @impl Crawly.Spider
    def base_url(), do: "https://www.staples.ca"
  
    @impl Crawly.Spider
    def init(), do: [start_urls: ["https://www.staples.ca/products/990119-en-staples-hyken-technical-mesh-task-chair-black"]]
  
    @impl Crawly.Spider
    def parse_item(response) do
      {:ok, document} = Floki.parse_document(response.body)

      # requests = Utils.build_absolute_urls(hrefs, base_url())
      # |> Utils.requests_from_urls()

      priceMatcher = ~r/"price\":(?<price>[[:digit:]]+),/

      price = document
      |> Floki.find("script")
      |> Enum.map(fn x -> Floki.text(x, js: true) end)
      |> Enum.filter(fn x -> String.match?(x, priceMatcher) end)
      |> Enum.map(fn x -> Regex.named_captures(priceMatcher, x) end)
      |> Enum.map(fn x -> String.to_integer(x["price"]) / 100 end)
      |> List.first
  
      %{
        :requests => [],
        :items => [%{price: price, url: response.request_url}]
      }
    end
end
