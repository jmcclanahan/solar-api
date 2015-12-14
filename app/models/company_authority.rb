class CompanyAuthority < ActiveRecord::Base
  belongs_to :company
  belongs_to :company_type
  has_many :lob
end
