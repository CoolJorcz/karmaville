class UsersController < ApplicationController
  def index

    number = params[:page].to_i
    @users = User.by_karma.page(number)
  end

end
