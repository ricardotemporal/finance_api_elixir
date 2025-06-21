defmodule FinanceApiWeb.AuthController do
  use FinanceApiWeb, :controller

  alias FinanceApi.Accounts
  alias FinanceApi.Guardian

  def login(conn, %{"email" => email, "password" => password}) do
    case Accounts.get_user_by_email(email) do
      nil ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Invalid email or password"})

      user ->
        if Bcrypt.verify_pass(password, user.password_hash) do
          {:ok, token, _claims} = Guardian.encode_and_sign(user)

          conn
          |> put_status(:ok)
          |> json(%{token: token})
        else
          conn
          |> put_status(:unauthorized)
          |> json(%{error: "Invalid email or password"})
        end
    end
  end
end
