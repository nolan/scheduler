ActionController::Routing::Routes.draw do |map|
  map.resources :schedules do |schedule|
    schedule.resources :stops
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
