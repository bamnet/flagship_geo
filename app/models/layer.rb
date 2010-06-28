class Layer < ActiveRecord::Base
  # Relations
  has_many :points
  has_many :paths
  
  # Validations
  validates :name, :presence => true
  validates :color, :hex_color => true
end
