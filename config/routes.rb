Rails.application.routes.draw do
  get "flashcards", to: "flashcards#index"
  post "/create_flashcard", to: "flashcards#create"
  get "/today", to: "flashcards#today"
  get "/show/:id", to: "flashcards#show"
  post "/repetition/:id", to: "repetitions#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
