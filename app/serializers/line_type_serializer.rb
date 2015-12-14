class LineTypeSerializer < ActiveModel::Serializer
  attributes :id, :line_type_desc, :line_type_code
  has_one :state
end
