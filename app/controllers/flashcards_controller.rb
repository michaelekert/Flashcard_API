class FlashcardsController < ApplicationController
  def index
    render json: {result: @flashcards = Flashcard.all}
  end

  def today
    render json: {today: Flashcard.today}
  end
  def create
    create = FlashcardService.call(params[:question],params[:answer])
    if create.success?
      render json: {result: create.result}
    else
      render json: {errors: create.errors}

    end
  end

  def show
    render json:{result: @flashcard = Flashcard.find(params[:id])}
  end
end
