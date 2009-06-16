class Stop < ActiveRecord::Base
  belongs_to :game
  belongs_to :schedule
  
  def distance_to(stop)
    game.home_team.distance_to(stop.game.home_team)
  end
end
