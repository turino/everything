Rails.application.routes.draw do
  resources :inbound_texts, only: %i[index]
end
