class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :option_A
      t.string :option_B
      t.string :option_C
      t.string :option_D
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
