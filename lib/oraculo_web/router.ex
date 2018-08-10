defmodule OraculoWeb.Router do
  use OraculoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OraculoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/api/:user", ApiController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", OraculoWeb do
  #   pipe_through :api
  # end
end
