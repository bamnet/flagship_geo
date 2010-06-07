class Layer < ActiveRecord::Base

 # Validations
 validates :name, :presence => true
 validates :color, :hex_color => true
end
