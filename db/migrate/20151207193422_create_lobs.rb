class CreateLobs < ActiveRecord::Migration
  def change
    create_table :lobs do |t|
      t.date :effective_date
      t.date :termination_date
      t.references :line_type, index: true, foreign_key: true
      t.references :company_authority, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
