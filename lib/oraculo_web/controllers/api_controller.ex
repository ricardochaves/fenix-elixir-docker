defmodule OraculoWeb.ApiController do
    use OraculoWeb, :controller
  
    def index(conn, _params) do

      a = GitHub.get_user_info()

      json conn, %{"name": "ricardo", "body": a}
    end
  end

  defmodule GitHub do
    use HTTPotion.Base
  
    def get_user_info() do
      GitHub.get("users/myfreeweb").body["public_repos"]
    end

    def process_url(url) do
      "https://api.github.com/" <> url
    end
  
    def process_request_headers(headers) do
      Dict.put headers, :"User-Agent", "test-agent"
    end
  
    def process_response_body(body) do
      body |> Poison.decode!
    end
  end