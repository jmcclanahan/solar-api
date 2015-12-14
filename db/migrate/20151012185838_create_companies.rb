class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :short_name
      t.integer :fein
      t.date :date_of_incorp
      t.references :domicile_type, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
