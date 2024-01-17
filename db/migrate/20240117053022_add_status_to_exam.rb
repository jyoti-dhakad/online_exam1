class AddStatusToExam < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :status, :integer
  end
end
