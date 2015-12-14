class CreateCompanyTypes < ActiveRecord::Migration
  def change
    create_table :company_types do |t|
      t.string :company_type_code
      t.string :company_type_desc
      t.boolean :isactive
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
