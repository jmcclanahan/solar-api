class Company < ActiveRecord::Base
  belongs_to :domicile_type
  belongs_to :country
  belongs_to :state
  has_many :company_authority

  validates :domicile_type, presence: true
  validates :state, presence: true

  def self.company_search(params)
    subQuery = Company.joins(:company_authority => :company_type)
    subQuery = subQuery.select("companies.id, company_types.company_type_desc, company_authorities.effective_date")

    query = Company.select("companies.id AS id, companies.name AS name, companies.short_name AS short_name,
                          companies.fein AS fein, states.state_desc AS state_desc, domicile_types.domicile_type_desc AS domicile_type_desc")

    if (!params[:company_type].blank?)
      query = query.select("group_concat(' ' || cta.company_type_desc || '(' || cta.effective_date || ')') AS company_type_desc")
    else
      query = query.select("group_concat(' ' || company_types.company_type_desc || '(' || company_authorities.effective_date || ')') AS company_type_desc")
    end

    query = query.joins(:domicile_type, :state)
    query = query.joins(:company_authority => :company_type)
    if (!params[:company_type].blank?)
      query = query.joins("INNER JOIN (#{subQuery.to_sql}) cta ON companies.id = cta.id")
    end

    query = query.where('states.id = :state_id', :state_id => params[:state_id])
    if (!params[:id].blank?)
      query = query.where('companies.id = :companyNumber', :companyNumber => params[:id])
    end
    if (!params[:name].blank?)
      query = query.where('companies.name LIKE :name', :name => "#{params[:name]}%")
    end
    if (!params[:short_name].blank?)
      query = query.where('companies.short_name LIKE :shortName', :shortName => "#{params[:short_name]}%")
    end
    if (!params[:fein].blank?)
      query = query.where('companies.fein = :fein', :fein => params[:fein])
    end
    if (!params[:date_of_incorp].blank?)
      query = query.where('companies.date_of_incorp = :dateOfIncorp', :dateOfIncorp => params[:date_of_incorp])
    end
    if (!params[:company_type].blank?)
      query = query.where('company_type_code = :companyTypeCode', :companyTypeCode => params[:company_type])
    end

    query = query.group("companies.id")

    query
  end
end
