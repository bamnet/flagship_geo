class Layer < ActiveRecord::Base
  # Relations
  has_many :points
  
  # Validations
  validates :name, :presence => true
  validates :color, :hex_color => true
end
