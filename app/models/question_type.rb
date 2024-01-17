class QuestionType < ApplicationRecord

    has_many :questions, dependent: :destroy
    has_many :exams, dependent: :destroy
    
    enum name: {
    'MCQ'=> 'multiple_choice',
    'True_false'=>'True-False',
    'short_answer'=>'short Answer'
  }
  enum status: { active: 0, inactive: 1 }
end
