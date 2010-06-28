class Coord < ActiveRecord::Base
  #Relations
  belongs_to :line, :polymorphic => true
end
