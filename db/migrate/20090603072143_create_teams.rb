class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.string :stadium
      t.integer :capacity
      t.string :city
      t.string :state
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
