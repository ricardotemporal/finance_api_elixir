defmodule FinanceApiWeb.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :finance_api,
    module: FinanceApi.Guardian,
    error_handler: FinanceApiWeb.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, scheme: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
