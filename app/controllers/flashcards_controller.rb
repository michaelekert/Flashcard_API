class FlashcardsController < ApplicationController

  def index
    render json: {flashcards: @flashcards = Flashcard.all}
  end

  def show
    render json:{result: @flashcard = Flashcard.find(params[:id])}
  end

  def update
    @flashcard = Flashcard.find(params[:id])
    update = FlashcardUpdateService.call(@flashcard,params[:question],params[:answer])

    if update.success?
      render json: {result: update.result}
    else
      render json: {result: update.errors}
    end
  end

  def destroy
    @flashcard = Flashcard.find(params[:id])
    destroy = FlashcardDestroyService.call(@flashcard)

    if destroy.success?
      render json: {result: "Deleted Flashcard"}
    else
      render json: {result: destroy.errors}
    end
  end

  def today
    render json: {today_flashcards: Flashcard.today}
  end

  def create
    create = FlashcardCreateService.call(params[:question], params[:answer])
    if create.success?
      render json: {result: create.result}
    else
      render json: {errors: create.errors}
    end
  end


end
