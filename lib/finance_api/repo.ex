defmodule FinanceApi.Repo do
  use Ecto.Repo,
    otp_app: :finance_api,
    adapter: Ecto.Adapters.Postgres
end
