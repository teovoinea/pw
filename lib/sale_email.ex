defmodule PriceWatch.Email do
    import Bamboo.Email
  
    def sale_email do
      new_email(
        to: "",
        from: "",
        subject: "PriceWatch notification",
        html_body: "<strong>The chair is on sale for 250</strong>",
        text_body: "The chair is on sale for 250"
      )
    end
end
