class CreateLineTypes < ActiveRecord::Migration
  def change
    create_table :line_types do |t|
      t.string :line_type_desc
      t.string :line_type_code
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
