class CreateQuestionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :question_types do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
