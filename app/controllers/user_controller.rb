class UserController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_user, :only => [:show]
  before_filter :find_archivments, :only => [:show]

  def show
  end

  protected

  def find_user
  	@user = User.find(params[:id])
  end

  def find_archivments
    user_archivments = User.find(current_user).archivs

    @points = user_archivments.sum(:points)
    @archviments_done = user_archivments.limit(5)
    
    if user_archivments.empty?
      @archivments_recommended = Archiv.first(5)
    else
      @archivments_recommended = Archiv.find(:all, :limit => 5, :conditions => ["archivs.id NOT IN (?)", user_archivments])
    end
  end
end
