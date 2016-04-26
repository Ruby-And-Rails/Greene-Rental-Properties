class RentalType < ActiveRecord::Base
  has_many :property, dependent: :destroy, :class_name => "Property", :foreign_key => "type_id"
end
