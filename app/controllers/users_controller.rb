class UsersController < ApplicationController
  def index
    @last_page = User.count/100
    @number = params[:page].to_i
    @users = User.by_karma.page(@number)
  end

end
