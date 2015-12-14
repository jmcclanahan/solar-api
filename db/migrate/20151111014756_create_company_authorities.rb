class CreateCompanyAuthorities < ActiveRecord::Migration
  def change
    create_table :company_authorities do |t|
      t.date :effective_date
      t.date :expiration_date
      t.date :issue_date
      t.references :company, index: true, foreign_key: true
      t.references :company_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
