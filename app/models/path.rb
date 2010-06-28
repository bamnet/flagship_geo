class Path < ActiveRecord::Base
  #Relations
  belongs_to :layer
  has_many :coords, :as => :line, :dependent => :destroy
  
  # Validations
  validates :name, :presence => true
end
