class Layer < ActiveRecord::Base

 # Validations
 validates :color, :hex_color => true
end
