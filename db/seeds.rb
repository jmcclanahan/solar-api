# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.delete_all
State.delete_all
Country.delete_all
DomicileType.delete_all
Company.delete_all
CompanyType.delete_all
CompanyAuthority.delete_all

# user1 = User.create(email: 'user@example.com', password: 'password')
# user2 = User.create(email: 'user2@example.com', password: 'password')

state1 = State.create(state_code: 'AL', state_desc: 'Alabama')
state2 = State.create(state_code: 'MO', state_desc: 'Missouri')
state3 = State.create(state_code: 'MD', state_desc: 'Maryland')

country1 = Country.create(country_code: 'USA', country_desc: 'United States')

domicile_type1 = DomicileType.create(domicile_type_code: 'F', domicile_type_desc: 'Foreign', state: state1)
domicile_type2 = DomicileType.create(domicile_type_code: 'D', domicile_type_desc: 'Domestic', state: state1)

company_type1 = CompanyType.create(company_type_code: 'SUR', company_type_desc: 'Surety', state: state1)
company_type2 = CompanyType.create(company_type_code: 'MTC', company_type_desc: 'Motor Club', state: state1)

line_type1 = LineType.create(line_type_code: 'G1', line_type_desc: 'Fire (380.261(1), RSMo)', state: state1)
line_type2 = LineType.create(line_type_code: 'G2', line_type_desc: 'Windstorm (380.261(2), RSMo)', state: state1)
line_type3 = LineType.create(line_type_code: 'G3', line_type_desc: 'Liability (380.261(3), RSMo)', state: state1)

company1 = Company.create(name: "ABC Company", fein: "12-123123123", state: state1, country: country1, domicile_type: domicile_type1)
company2 = Company.create(name: "XYZ Company", fein: "1212", state: state1, country: country1, domicile_type: domicile_type1)
company3 = Company.create(name: "MO Company", fein: "1213", state: state1, country: country1, domicile_type: domicile_type1)
company4 = Company.create(name: "MO2 Company", fein: "1212", state: state1, country: country1, domicile_type: domicile_type2)

# 50000.times do |company|
#   company += 1
#   createdCompany = Company.create(name: "#{company} Company", fein: "1111111#{company}", state: state1, country: country1, domicile_type: domicile_type1)
#   CompanyAuthority.create(effective_date: Time.zone.today, expiration_date: Time.zone.today,
#                        issue_date: Time.zone.today, company: createdCompany, company_type: company_type1);
# end

company_authority1 = CompanyAuthority.create(effective_date: Time.zone.today, expiration_date: Time.zone.today,
                     issue_date: Time.zone.today, company: company1, company_type: company_type1);
company_authority2 = CompanyAuthority.create(effective_date: Time.zone.today, expiration_date: Time.zone.today,
                     issue_date: Time.zone.today, company: company1, company_type: company_type2);
company_authority3 = CompanyAuthority.create(effective_date: Time.zone.today, expiration_date: Time.zone.today,
                     issue_date: Time.zone.today, company: company2, company_type: company_type1);
company_authority4 = CompanyAuthority.create(effective_date: Time.zone.today, expiration_date: Time.zone.today,
                     issue_date: Time.zone.today, company: company3, company_type: company_type2);
company_authority5 = CompanyAuthority.create(effective_date: Time.zone.today, expiration_date: Time.zone.today,
                     issue_date: Time.zone.today, company: company4, company_type: company_type1);
company_authority6 = CompanyAuthority.create(effective_date: Time.zone.today, expiration_date: Time.zone.today,
                     issue_date: Time.zone.today, company: company4, company_type: company_type2);
