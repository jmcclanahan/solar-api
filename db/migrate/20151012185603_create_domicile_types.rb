class CreateDomicileTypes < ActiveRecord::Migration
  def change
    create_table :domicile_types do |t|
      t.string :domicile_type_code
      t.string :domicile_type_desc
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
