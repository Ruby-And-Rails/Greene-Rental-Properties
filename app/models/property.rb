class Property < ActiveRecord::Base
  has_many :property_images, dependent: :destroy
  belongs_to :rental_types, :class_name => "RentalType", :foreign_key => "type_id"

end
