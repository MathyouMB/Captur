# Captur

A platform for hosting challenge based contests such as capture the flag events.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

# Articles

  *  https://pspdfkit.com/blog/2018/how-to-run-your-phoenix-application-with-docker/
  *  https://lobotuerto.com/blog/building-a-json-api-in-elixir-with-phoenix/
  *  https://www.youtube.com/watch?v=THUG8J3xSYw

# Commands
  
  * mix phx.gen.json Games User users username:string email:string password:string
  * mix phx.gen.json Games Game games title:string description:text start_date:datetime end_date:datetime hidden:boolean user_id:references:users
  * mix phx.gen.json Games Participant participants


