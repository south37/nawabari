class UsersController < ApplicationController
  # GET /users/rank/:id
  def rank
    @user = User.find(:first, :conditions => ["foursq_id = :foursq_id", { foursq_id: params[:id] }])
    if @user
      territory = @user.territory
      @rank = User.find(:all, :conditions => ["territory > :territory", { territory: territory }]).length + 1
    else
      @rank = nil
    end

    render json: { rank: @rank }
  end

  # GET /user/update/:id?territory=
  def update
    @user = User.find(:first, :conditions => ["foursq_id = :foursq_id", { foursq_id: params[:id] }])
    if @user && @user.update_attributes({foursq_id: params[:id], territory: params[:territory]})
      redirect_to action: 'rank', id: params[:id]
    else
      render json: nil
    end
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
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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
end