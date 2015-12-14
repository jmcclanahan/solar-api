class CompanyAuthoritySerializer < ActiveModel::Serializer
  attributes :effective_date, :expiration_date, :issue_date
  has_one :company
  has_one :company_type
  has_many :lob
end
