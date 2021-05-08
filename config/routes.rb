Rails.application.routes.draw do
  root 'check_texts#show'
  post 'check_texts/check_text'
  get 'check_texts/show'
end
