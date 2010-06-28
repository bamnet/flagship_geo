class CreateCoords < ActiveRecord::Migration
  def self.up
    create_table :coords do |t|
      t.decimal :latitude, :precision => 15, :scale => 10, :default => 0
      t.decimal :longitude, :precision => 15, :scale => 10, :default => 0
      t.integer :position
      t.string :line_type
      t.integer :line_id

      t.timestamps
    end
  end

  def self.down
    drop_table :coords
  end
end
