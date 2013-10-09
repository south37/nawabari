class TerritoriesController < ApplicationController
  # GET /territories/:user_id
  def index_with_user
    user = User.find_by_foursq_id params[:user_id]
    territories = user.territories

    ts_hash = []
    territories.each do |territory|
      t_hash = territory.attributes
      t_hash.store 'beenHere', territory.been_here
      t_hash.store 'venueId', territory.venue_id
      t_hash.store 'userId',  territory.user_id
      ts_hash << t_hash
    end

    render json: { type: :territories, territories: ts_hash }
  end
 
  # GET /territories
  # GET /territories.json
  def index
    @territories = Territory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @territories }
    end
  end

  # GET /territories/1
  # GET /territories/1.json
  def show
    @territory = Territory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @territory }
    end
  end

  # GET /territories/new
  # GET /territories/new.json
  def new
    @territory = Territory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @territory }
    end
  end

  # POST /territories
  # POST /territories.json
  def create
    @territory = Territory.new(params[:territory])

    respond_to do |format|
      if @territory.save
        format.html { redirect_to @territory, notice: 'Territory was successfully created.' }
        format.json { render json: @territory, status: :created, location: @territory }
      else
        format.html { render action: "new" }
        format.json { render json: @territory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /territories/1
  # DELETE /territories/1.json
  def destroy
    @territory = Territory.find(params[:id])
    @territory.destroy

    respond_to do |format|
      format.html { redirect_to territories_url }
      format.json { head :no_content }
    end
  end
end
