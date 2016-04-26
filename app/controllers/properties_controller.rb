class PropertiesController < ApplicationController
  def index
    if params[:type]
      @property_type = RentalType.eager_load(:property).find_by('unique_id'=>params[:type])
      @properties = @property_type.property
#      @properties = Property.find(:all, :conditions => [ "type_id", @property_type.id], :limit => 50)
    else
      @properties = Property.where('property_type'=>1).order(:listorder)
    end
  end
  def property_details
    #@property_detail = Property.find_by_unique_id(params[:uniq_id])
    @property_detail = Property.eager_load(:rental_types).find_by('unique_id'=>params[:uniq_id])
    
    @primary_photo = PropertyImage.select("property_image").find_by('property_id'=>@property_detail.id, 'is_primary'=>1)
  end
end
