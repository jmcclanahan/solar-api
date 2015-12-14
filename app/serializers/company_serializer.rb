class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :fein

  has_one :domicile_type
  has_one :country
  has_one :state

end
