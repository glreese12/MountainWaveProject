class EventSweeper < ActionController::Caching::Sweeper
  observe Event # This sweeper is going to keep an eye on the Event model
 
  # If our sweeper detects that an Event was created call this
  def before_create(event)
      expire_cache_for(event)
  end
 
  # If our sweeper detects that a Event was updated call this
  def before_update(event)
      expire_cache_for(event)
  end
 
  # If our sweeper detects that a Event was deleted call this
  def before_destroy(event)
      expire_cache_for(event)
  end
 
  private
  
  def expire_cache_for(event)
    # Expire the index page (and supported formats) now that we added a new product
    expire_page events_path
    expire_page events_path(:format => 'kml')
    expire_page events_path(:format => 'rss')
    expire_page events_path(:format => 'xml')
    expire_page events_path(:format => 'json')
    expire_page events_path(:format => 'js')
    expire_page :controller => 'events', :action => 'index'
    expire_page '/index.html'
    
    # expire all potential category type requests
    for cat in event.categories
      expire_page event_type_path(:category_id => cat.id, :format => 'json')
      expire_page event_type_path(:category_id => cat.id, :format => 'xml')
      expire_page event_type_path(:category_id => cat.id)
    end
  end
end