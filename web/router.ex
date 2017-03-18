defmodule HofiPhoenix.Router do
  use HofiPhoenix.Web, :router



  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["html","json"]

  end

  scope "/", HofiPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    
  end

  # Other scopes may use custom stacks.
   scope "/api" do
     pipe_through :api
     forward "/", Absinthe.Plug, schema: HofiPhoenix.Schema 
     forward "/graphiql", Absinthe.Plug.GraphiQL, schema: HofiPhoenix.Schema 

   end
end
