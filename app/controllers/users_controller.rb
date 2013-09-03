class UsersController < ApplicationController
  def index
    @last_page = User.count/100
    @number = params[:page].to_i
    puts params
    @users = Rails.cache.read 'users'
    if @users
    else
      @users = User.by_karma.page(@number)
      Rails.cache.write('users', @users)
    end
  end

end
