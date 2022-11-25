module ApplicationHelper

    # Returns the full title on a per-page basis.
    def full_title(page_title = '')
      base_title = "Ruby on Rails Tutorial Sample App"
      if page_title.empty?
        base_title
      else
        "#{page_title} | #{base_title}"
      end
    end

    def is_active(controller, action)       
      params[:controller] == controller && params[:action] == action ? "active" : "notactive"       
    end
  
end
