class CategorySweeper < ActionController::Caching::Sweeper
  observe Category # This sweeper is going to keep an eye on the category model
 
  # If our sweeper detects that a category was created call this
  def after_create(category)
      expire_cache_for(category)
  end
 
  # If our sweeper detects that a category was updated call this
  def after_update(category)
      expire_cache_for(category)
  end
 
  # If our sweeper detects that a Product was deleted call this
  def after_destroy(category)
      expire_cache_for(category)
  end
 
  private
  def expire_cache_for(category)
    # Expire the index page now that we added a new category 
    # Expire the cache since we added a new Category
    expire_page categories_path
    expire_page categories_path(:format => 'xml')
    expire_page categories_path(:format => 'json')
    expire_page :controller => 'categories', :action => 'index'
  end
end