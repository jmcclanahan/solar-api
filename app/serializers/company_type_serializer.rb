class CompanyTypeSerializer < ActiveModel::Serializer
  attributes :id, :company_type_code, :company_type_desc

  has_one :state
end
