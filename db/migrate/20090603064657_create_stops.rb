class CreateStops < ActiveRecord::Migration
  def self.up
    create_table :stops do |t|
      t.integer :schedule_id
      t.integer :game_id
      t.string :sights
      t.string :people

      t.timestamps
    end
  end

  def self.down
    drop_table :stops
  end
end
