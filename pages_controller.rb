class PagesController < ApplicationController
  def main
    @user_input = params[:user_input]
  end
end
