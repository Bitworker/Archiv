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
    userarchivments = User.find(current_user).archivs

    if userarchivments.empty?
      @points = 0
      @archivments_recommended = Archiv.first(5)
    else
      @points = userarchivments.joins(:userarchivments).where('userarchivments.vote_success' => true).sum(:points)
      @archivments_recommended = Archiv.find(:all, :limit => 5, :conditions => ["archivs.id NOT IN (?)", userarchivments])
      @archivments_need_vote = userarchivments.joins(:userarchivments).where('userarchivments.vote_success' => false).limit(5)
      @archivments_done = userarchivments.joins(:userarchivments).where('userarchivments.vote_success' => true).limit(5)
    end
  end
end
