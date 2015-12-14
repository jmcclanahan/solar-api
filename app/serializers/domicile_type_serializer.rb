class DomicileTypeSerializer < ActiveModel::Serializer
  attributes :id, :domicile_type_code, :domicile_type_desc

  has_one :state
end
