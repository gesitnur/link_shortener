Rails.application.routes.draw do
  root "links#new"

  resources :links, only: [:new, :create, :show]

  # route untuk redirect pakai short_code
  get "/:short_code", to: "links#redirect", as: :short
end
