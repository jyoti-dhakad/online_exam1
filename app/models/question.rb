class Question < ApplicationRecord
  belongs_to :category
  belongs_to :question_type

  has_many :options, dependent: :destroy
  
  
  accepts_nested_attributes_for :options, allow_destroy: true
end
