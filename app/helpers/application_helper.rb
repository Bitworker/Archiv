module ApplicationHelper

  #title creation
  def title(page_title)
    content_for(:title) { page_title }
  end

  # Active links based on actions  
  def is_active_link?(controller_name)
    "active-link" if params[:controller] == controller_name
  end
  

end
