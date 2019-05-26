Rails.application.routes.draw do
  resources :users, :diaries, :article_categories
end
