class StateSerializer < ActiveModel::Serializer
  attributes :id, :state_code, :state_desc
end
