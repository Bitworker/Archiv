class ArchivsController < ApplicationController
  before_filter :authenticate_user!

  before_filter :get_categories, :only => [:create, :new, :edit] 
  before_filter :get_user_archivment_status, :only => [:show] 

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
        format.html { redirect_to @archiv, notice: 'Erfolg wurde erfolgreich Erstellt.' }
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
        format.html { redirect_to @archiv, notice: 'Erfolg wurde erfolgreich bearbeitet.' }
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

  protected

  def get_categories
    @categories = Category.all
  end

  def get_user_archivment_status
    begin
      @user_archivment_status = User.find(current_user).archivs.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @user_archivment_status = false
    end
  end
end
