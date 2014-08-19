class PointOfInterestsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  cache_sweeper :point_of_interest_sweeper,
     :only => [:update, :destroy, :create]
  caches_page :index, :if => Proc.new { |c| !c.request.format.html? } 
  #caches_page :show, :if => Proc.new {|c| c.request.format.json? } # caches the page in function show() to public/events/<eventId>/point_of_interests/<poId>.json
   
  # GET /point_of_interests
  # GET /point_of_interests.xml
  def index
    @event = Event.find(params[:event_id])
    @point_of_interests = @event.point_of_interests

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @point_of_interests }
      format.json { render :json => @point_of_interests }
    end
  end

  # GET /point_of_interests/1
  # GET /point_of_interests/1.xml
  # GET /point_of_interests/1.json // this is new, and will delete & refresh itself with feature data via WMS
  def show
    @point_of_interest = PointOfInterest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @point_of_interest }
      format.json { render :json => @point_of_interest.as_json_single() }
    end
  end

  # GET /point_of_interests/new
  # GET /point_of_interests/new.xml
  def new
    @event = Event.find(params[:event_id])
    @point_of_interest = PointOfInterest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @point_of_interest }
    end
  end

  # GET /point_of_interests/1/edit
  def edit
    @event = Event.find(params[:event_id])
    @point_of_interest = PointOfInterest.find(params[:id])
  end

  # POST /point_of_interests
  # POST /point_of_interests.xml
  def create
    @event = Event.find(params[:event_id])
    @point_of_interest = @event.point_of_interests.new(params[:point_of_interest])

    respond_to do |format|
      if @point_of_interest.save
        format.html { redirect_to(@event, :notice => 'Point of interest was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event_point_of_interest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @point_of_interest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /point_of_interests/1
  # PUT /point_of_interests/1.xml
  def update
    @event = Event.find(params[:event_id])
    @point_of_interest = PointOfInterest.find(params[:id])

    respond_to do |format|
      if @point_of_interest.update_attributes(params[:point_of_interest])
        format.html { redirect_to(event_point_of_interest_path, :notice => 'Point of interest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @point_of_interest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /point_of_interests/1
  # DELETE /point_of_interests/1.xml
  def destroy
    @point_of_interest = PointOfInterest.find(params[:id])
    @point_of_interest.destroy

    respond_to do |format|
      format.html { redirect_to(point_of_interests_url) }
      format.xml  { head :ok }
    end
  end
end
