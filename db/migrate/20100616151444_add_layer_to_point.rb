class AddLayerToPoint < ActiveRecord::Migration
  def self.up
    add_column :points, :layer_id, :integer
  end

  def self.down
    remove_column :points, :layer_id
  end
end
