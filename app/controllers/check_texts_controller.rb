class CheckTextsController < ApplicationController
  def check_text
    @spell_check_error = CheckText.check_text(params[:text])
    puts @spell_check_error
    render action: :show
  end
end
