json.published_at       @post.published_at
json.title              @post.title
json.body               @post.body
json.category           @post.category
json.image              @post.image.url("#{@post.image_mode}_big_thumb")
