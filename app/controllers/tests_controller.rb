class TestsController < ApplicationController
  def index
    render json: { success: true }
  end
end
