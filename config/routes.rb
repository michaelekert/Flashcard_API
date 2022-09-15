Rails.application.routes.draw do
  get "flashcards", to: "flashcards#index"
  post "/create", to: "flashcards#create"
  get "/today", to: "flashcards#today"
  get "/show/:id", to: "flashcards#show"
  put "/update/:id", to: "flashcards#update"
  post "/repetition/:id", to: "repetitions#create"
  delete "/delete/:id", to: "flashcards#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
