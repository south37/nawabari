class UsersController < ApplicationController
  # GET /users/rank/:id
  def rank
    user = find_user_by_foursq_id params[:id]
    if user
      area = user.area
      superior_users = User.find(:all, :conditions => ["area > :area", { area: area }])
      @rank = superior_users.length + 1
      @users_num = User.all.length
    else
      @rank = nil
      @users_num = nil
    end

    render json: [{ rank: @rank, users_num: @users_num }]
  end

  # GET /user/update/:id/:name/:area
  def update
    user = find_user_by_foursq_id params[:id]
    user_params = { foursq_id: params[:id], name: params[:name], area: params[:area] }
    
    if ( (user && user.update_attributes(user_params)) || User.new(user_params).save )
      redirect_to action: 'rank', id: params[:id]
    else
      render json: nil
    end
  end

  # GET /user/ranking/:num
  def ranking
    ranker_users = User.find(:all, limit: params[:num], order: 'area DESC')
    render json: ranker_users
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  def find_user_by_foursq_id(id)
    User.find(:first, :conditions => ["foursq_id = :foursq_id", { foursq_id: id }])
  end
end
