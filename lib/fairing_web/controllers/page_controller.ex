defmodule FairingWeb.PageController do
  use FairingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
