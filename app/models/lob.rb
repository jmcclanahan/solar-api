class Lob < ActiveRecord::Base
  belongs_to :line_type
  belongs_to :company_authority
end
