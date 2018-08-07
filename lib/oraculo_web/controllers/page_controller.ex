defmodule OraculoWeb.PageController do
  use OraculoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
