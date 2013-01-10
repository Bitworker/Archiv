class StreamController < ApplicationController
  before_filter :build_vote_update, :only => [:index] 
  
  def index
    archivment = Userarchivment.offset(rand(Userarchivment.where(:vote_success => false).count)).where(:vote_success => false).first
    @archivment_upvote = archivment.upvote
    @archivment_downvote = archivment.downvote
    @archivment = archivment.archiv
    @userarchivment = archivment
  end
  
  protected
  
  def build_vote_update
    @vote = Userarchivment.new
  end
end
