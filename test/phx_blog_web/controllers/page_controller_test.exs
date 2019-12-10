defmodule PhxBlogWeb.PageControllerTest do
  use PhxBlogWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Phx Blog"
  end
end
