namespace :db do
  desc "Load seed csv files into the current environment's database." 
  task :seed => :environment do
    
    f = File.open(RAILS_ROOT + "/db/seed/teams.csv","r")
    f.readlines.each do |record|
      
      team = record.split(',')
      new_team = Team.create(
        :name => team[0],
        :stadium => team[1],
        :capacity => team[2],
        :city => team[3],
        :state => team[4].strip
      )
      
      if new_team.new_record?
        if new_team.errors.on(:name)
          puts "#{new_team.name} - Already Added"
        else
          puts "FAILED: #{new_team.name}"
        end
      else
        puts new_team.name
      end

    end
    f.close
    
    # Reload Teams
    Team.reset_column_information
    
    f = File.open(RAILS_ROOT + "/db/seed/games.csv","r")
    week = 1
    f.readlines.each do |record|
      
      game = record.split(',')
      
      away_team = game[3].strip
      away_teams = Team.find(:all) do
        any do
          name =~ "%#{away_team}%"
          city =~ "%#{away_team}%"
        end
      end
      
      home_team = game[4].strip
      home_teams = Team.find(:all) do
        any do
          name =~ "%#{home_team}%"
          city =~ "%#{home_team}%"
        end
      end
      
      # If a game can't find matching teams or it matches more than one team
      unless away_teams.size == 1 && home_teams.size == 1
        puts "Error matching: #{record}"
        unless away_teams.size == 1
          puts " Away Team: #{away_team}"
          puts " Matches: #{away_teams.inspect}"
        end
        unless home_team.size == 1
          puts " Home Team: #{home_team}"
          puts " Matches: #{home_teams.inspect}"
        end
        
        break
      end
      
      # Display when week is loaded
      unless week == game[0].to_i
        puts "Week #{week} Added"
        week = game[0].to_i
      end
      
      year = week > 16 ? 2010 : 2009
      new_game = Game.create(
        :home_team_id => home_teams[0].id,
        :away_team_id => away_teams[0].id,
        :week => game[0],
        :date => Date.parse("#{game[1]}, #{year}"),
        :time => Time.parse(game[2])
      )
      
      puts "#{new_game.away_team.name} vs #{new_game.home_team.name} @ #{new_game.date}"
    end
    f.close
    
  end
end