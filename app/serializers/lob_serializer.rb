class LobSerializer < ActiveModel::Serializer
  attributes :id, :effective_date, :termination_date
  has_one :line_type
  has_one :company_authority
end
