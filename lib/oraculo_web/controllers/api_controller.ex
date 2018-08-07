defmodule OraculoWeb.ApiController do
    use OraculoWeb, :controller
  
    def index(conn, _params) do


        
      json conn, %{"name": "ricardo"}
    end
  end
  