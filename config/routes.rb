Rails.application.routes.draw do
  root "bot#index"
  post "responder", to: "bot#responder"
  
  # Se quiser pode manter para acessar /bot/index direto:
  get "bot/index"

  # Remova get "bot/responder" para evitar conflito!
end
