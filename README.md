# PhxBlog

Running locally:

  * `cp .env.dist .env` (edit values if needed)
  * `source .env`
  * `mix deps.get`
  * `mix ecto.setup` (make sure to run `source .env` first)
  * `cd assets && npm install`
  * `mix phx.server` (make sure to run `source .env` first)

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
