class RepetitionsController < ApplicationController
  def create
    @flashcard = Flashcard.find(params[:id])
    create = RepetitionService.call(@flashcard,params[:grade])
    if create.success?
      render json: {result: create.result}
    else
      render json: {errors: create.errors}

    end
  end
end
