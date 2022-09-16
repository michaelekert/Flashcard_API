require 'rails_helper'

RSpec.describe "Flashcards", type: :request do


  describe "GET /index" do
    it "render all flashcards" do
      get flashcards_url
      expect(response).to be_successful
    end
  end
end
