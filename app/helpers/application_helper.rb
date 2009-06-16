# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def nav_to(resource_name)
    link_to(resource_name.to_s.capitalize, url_for(:controller => resource_name), :class => resource_name.to_s == controller.controller_name ? 'active' : nil)
  end
end
