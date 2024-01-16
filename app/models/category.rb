class Category < ApplicationRecord

    has_many :questions, dependent: :destroy
    
    enum name: {
    'php coding'=> 'php coding',
    'C coding'=>'C coding',
    'C++ coding'=>'C++ Coding',
    'RubyOnRails coding'=>'Ruby On Rails Coding',
    'Node.js coding'=>'Node js coding',
    'React.js coding'=>'React js coding',
    'Java coding'=>'Java coding'
  }

  enum status: { active: 0, inactive: 1 }
end
