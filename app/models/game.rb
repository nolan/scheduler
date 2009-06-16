class Game < ActiveRecord::Base  
  belongs_to :home_team, :class_name => 'Team'
  belongs_to :away_team, :class_name => 'Team'
  acts_as_mappable :through => :home_team
  
  validates_uniqueness_of :home_team_id, :scope => :date
  validates_uniqueness_of :away_team_id, :scope => :date
  
  named_scope :for_week, lambda { |week|
    {:conditions => {:week => week},
      :include => [:home_team, :away_team],
      :order => 'games.date, games.time'}
  }
  
  named_scope :after, lambda { |game|
    {:conditions => ['(games.date > ? AND games.week = ?) OR games.week = ?', game.date, game.week, game.week+1],
      :order => 'games.date, games.time'}
  }
  
  def distance_to(game)
    home_team.distance_to(game.home_team)
  end
  
end
