class ArchivsController < ApplicationController
  before_filter :authenticate_user!

  before_filter :get_categories, :only => [:create, :new, :edit] 
  before_filter :get_userarchivment, :only => [:show, :update_vote, :update_userarchivment] 
  before_filter :get_user_archivment_status, :only => [:show, :update_vote] 
  before_filter :build_vote_update, :only => [:show, :update_vote] 

  # GET /archivs
  # GET /archivs.json
  def index
    @archivs = Archiv.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @archivs }
    end
  end

  # GET /archivs/1
  # GET /archivs/1.json
  def show
    @archiv = Archiv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @archiv }
    end
  end

  # GET /archivs/new
  # GET /archivs/new.json
  def new
    @archiv = Archiv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @archiv }
    end
  end

  # GET /archivs/1/edit
  def edit
    @archiv = Archiv.find(params[:id])
  end

  # POST /archivs
  # POST /archivs.json
  def create
    @archiv = Archiv.new(params[:archiv])

    respond_to do |format|
      if @archiv.save
        format.html { redirect_to @archiv, notice: 'Erfolg wurde Erstellt.' }
        format.json { render json: @archiv, status: :created, location: @archiv }
      else
        format.html { render action: "new" }
        format.json { render json: @archiv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /archivs/1
  # PUT /archivs/1.json
  def update
    @archiv = Archiv.find(params[:id])

    respond_to do |format|
      if @archiv.update_attributes(params[:archiv])
        format.html { redirect_to @archiv, notice: 'Erfolg wurde bearbeitet.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @archiv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archivs/1
  # DELETE /archivs/1.json
  def destroy
    @archiv = Archiv.find(params[:id])
    @archiv.destroy

    respond_to do |format|
      format.html { redirect_to archivs_url }
      format.json { head :no_content }
    end
  end

  def create_userarchivment
    @new_userarchivment = Userarchivment.new
    @new_userarchivment.user_id = current_user.id
    @new_userarchivment.archiv_id = params[:id]
    if @new_userarchivment.save
      flash[:notice] = "Dieser Erfolg steht nun zur Abstimmung zur bereit!"
      redirect_to archiv_path(@new_userarchivment.archiv_id)
    end
  end

  def update_userarchivment
    @archiv = Archiv.find(params[:id])
    if @userarchivment.update_attributes(params[:userarchivment])
      respond_to do |format|
        format.js {render :layout => false}
      end
    end
  end

  def update_vote
    if params[:commit] == "Upvote"
      @archivment_upvote = @archivment_upvote + 1

      if @userarchivment.update_attributes(:upvote => @archivment_upvote)
        respond_to do |format|
          format.js {render :layout => false}
        end
      end
    end

    if params[:commit] == "Downvote"
      @archivment_downvote = @archivment_downvote + 1

      if @userarchivment.update_attributes(:downvote => @archivment_downvote)
        respond_to do |format|
          format.js {render :layout => false}
        end
      end
    end

    @userarchivment.update_attributes(:vote_success => vote_success(@userarchivment))
  end

  protected

  def get_categories
    @categories = Category.all
  end

  def get_userarchivment
    @userarchivment = Userarchivment.find_by_user_id_and_archiv_id(current_user.id,params[:id])
  end

  def get_user_archivment_status
    begin
      @archivment_upvote   = @userarchivment.upvote
      @archivment_downvote = @userarchivment.downvote
      if @userarchivment.vote_success
        @user_archivment_status = "done"
      else
        @user_archivment_status = "need_vote"
      end
    rescue NoMethodError
      @user_archivment_status = "recommended"
    end
  end

  def build_vote_update
    @vote = Userarchivment.new
  end

  def vote_success(userarchivment)
    if (userarchivment.upvote > 0 && userarchivment.downvote == 0) || ((userarchivment.upvote / userarchivment.downvote) >= 5)
      true
    else
      false
    end
  end
end
