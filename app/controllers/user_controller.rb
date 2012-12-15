class UserController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_user, :only => [:show]

  def show
  end

  protected

  def find_user
  	@user = User.find(params[:id])
  end

end
