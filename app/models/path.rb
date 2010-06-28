class Path < ActiveRecord::Base
  #Relations
  belongs_to :layer
  
  # Validations
  validates :name, :presence => true
end
