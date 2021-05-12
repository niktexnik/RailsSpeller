class CheckTextsController < ApplicationController
  def check_text
    @spell_check_error = CheckText.check_text(params[:text])
    render action: :show
  end
end
  def show 
  end