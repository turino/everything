Rails.application.routes.draw do
  root "tests#index"

  resources :inbound_texts, only: %i[index]
end
