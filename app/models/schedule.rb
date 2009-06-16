class Schedule < ActiveRecord::Base
  has_many :stops, :dependent => :destroy
  has_many :games, :through => :stops, :order => 'games.date ASC'
  
  def last_game
    @last_game ||= games.find(:first, :order => 'games.date DESC')
  end
  
  def last_week
    @last_game.week
  end
  
  def previous_game(game)
    games.find(:first, :order => 'games.date DESC', :conditions => ['games.date < ?', game.date])
  end
end
