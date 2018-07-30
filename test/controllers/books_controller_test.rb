require "rails_helper"

require 'test_helper'

require 'rspec'

require './books_controller'

RSpec.describe BooksController do
  context "GET index" do
    it "assign @book" do
      book = Book.create
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
