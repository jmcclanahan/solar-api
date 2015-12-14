class CountrySerializer < ActiveModel::Serializer
  attributes :id, :country_code, :country_desc
end
