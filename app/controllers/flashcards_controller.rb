class FlashcardsController < ApplicationController
  def create
    create = FlashcardService.call(params[:question],params[:answer])
    if create.success?
      render json: {result: create.result}
    else
      render json: {errors: create.errors}

    end
  end
end
