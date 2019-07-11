defmodule FairingWeb.Router do
  use FairingWeb, :router

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

  scope "/", FairingWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", FairingWeb do
  #   pipe_through :api
  # end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Hello.Accounts.get_user!(user_id))
    end
  end
end
