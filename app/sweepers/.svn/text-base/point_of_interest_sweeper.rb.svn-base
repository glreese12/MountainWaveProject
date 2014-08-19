class PointOfInterestSweeper < ActionController::Caching::Sweeper
  observe PointOfInterest # This sweeper is going to keep an eye on the Poi model
 
  # If our sweeper detects that an Event was created call this
  def after_create(poi)
      expire_cache_for(poi)
  end
 
  # If our sweeper detects that a Event was updated call this
  def after_update(poi)
      expire_cache_for(poi)
  end
 
  # If our sweeper detects that a Product was deleted call this
  def after_destroy(poi)
      expire_cache_for(poi)
  end
 
  private
  
  def expire_cache_for(poi)
    # Expire the index page (and supported formats) for POIs
    expire_page event_point_of_interests_path(:event_id => poi.event)
    expire_page event_point_of_interests_path(:event_id => poi.event, :format => 'xml')
    expire_page event_point_of_interests_path(:event_id => poi.event, :format => 'json')
    
    # All event pages need to be invalidated
    expire_page events_path
    expire_page events_path(:format => 'kml')
    expire_page events_path(:format => 'rss')
    expire_page events_path(:format => 'xml')
    expire_page events_path(:format => 'json')
    #expire_action events_path(:format => 'json')
    expire_page events_path(:format => 'js')
    expire_page :controller => 'events', :action => 'index'
  end
end