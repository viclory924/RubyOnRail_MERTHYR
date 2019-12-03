json.title           @deal.title
json.description     @deal.description
json.business        @deal.business_name
json.start_date      @deal.start_date
json.end_date        @deal.end_date
json.terms           @deal.terms
json.image           @deal.image.url(:thumb)
