class EventsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy, :send_mail]
  
  cache_sweeper :event_sweeper,
    :only => [:update, :destroy, :create]
  caches_page :index , :if => Proc.new { |c| !c.request.format.html? }
  caches_page :type, :if => Proc.new { |c| !c.request.format.html? }
  
  def send_mail
    @event = Event.find(params[:event_id])
    begin
      Notifier.notify(@event).deliver
    rescue Exception => exc
      logger.error("Mail Send Failure: #{exc.message}")
      redirect_to(events_path, :notice => "Sorry, we're unable to send mail at this time.")
    else
      redirect_to(events_path, :notice => "Users have been notified regarding #{@event.name}")
    end
  end
  
  def type
    @events = Event.type(params[:category_id])
    @category = Category.find(params[:category_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  # { render :xml => @events }
      format.json { render :json => @events }  # renders them directly as json, not with the as_json() function
    end
  end
  
  # GET /events
  # GET /events.xml
  def index
    @events = Event.last_365
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  # { render :xml => @events }
      format.rss { render :layout => false } # this causes ../views/events/index.rss.builder to run/render
      #format.json { render :json => @events.as_json() }
      format.json
      format.kml
      # The .js format supports the corporate website by generating the RSS as 
      # a Javascript var.  This is done to avoid the need for a proxy
      # to_rss_for_js() exists in the Event model and removes any single
      # quotes from the text data 
      format.js do
        render :inline => "var event_xml = '#{Event.to_rss_for_js(@events)}';",
        :content_type => 'text/javascript'
      end
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    params[:event][:category_ids] ||= []
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end

end
