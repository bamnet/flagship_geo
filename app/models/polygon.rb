class Polygon < ActiveRecord::Base
  #Relations
  belongs_to :layer
  has_many :coords, :as => :line, :dependent => :destroy
  
  # Validations
  validates :name, :presence => true
  
  accepts_nested_attributes_for :coords, :allow_destroy => true
end
