class JobSerializer < ActiveModel::Serializer
  attributes :title, :description, :latitude, :longitude, :company_name

  def company_name
    object.employer.company_name
  end

end
