class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :state_code
      t.string :state_desc

      t.timestamps null: false
    end
  end
end
