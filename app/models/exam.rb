class Exam < ApplicationRecord
  belongs_to :question
  belongs_to :question_type
  belongs_to :category
  belongs_to :answer

end
