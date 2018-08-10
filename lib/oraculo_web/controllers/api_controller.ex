defmodule OraculoWeb.ApiController do
    use OraculoWeb, :controller

    def index(conn,  %{"user" => user_login}) do

      a = GitHub.get_user_info(user_login)

      json conn, %{name: "ricardo", body: a}
    end
  end

  defmodule GitHub do
    use HTTPotion.Base
    require Logger
  
    def get_user_info(user_login) do
      GitHub.get("users/" <> user_login).body["public_repos"]
    end

    def process_url(url) do
      host = Application.get_env(:oraculo, GitHub)[:host]
      
      Logger.debug  "Executing url: " <> host <> url

      host <> url
    end
  
    def process_request_headers(headers) do
      #Map.put headers, :"User-Agent", "test-agent"
      headers ++ [{:"User-Agent", "test-agent"}]
    end
  
    def process_response_body(body) do
      body |> Poison.decode!
    end
  end