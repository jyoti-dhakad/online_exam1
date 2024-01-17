class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :duration
      t.references :question, null: false, foreign_key: true
      t.references :question_type, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
