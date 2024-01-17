class Answer < ApplicationRecord
  belongs_to :question
  has_many :exams, dependent: :destroy
end
