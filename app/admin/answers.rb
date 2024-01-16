ActiveAdmin.register Answer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :text, :question_id, :status

  #
  index do
    selectable_column
    id_column
    column "Question" do |ans|
      question = Question.find_by(id: ans.question_id)
      question&.text
    end
    column "Answer" do |ans|
      ans.text
    end
    column "Question Type" do |ans|
      ans.question.question_type
    end
    
    column :status
    
    actions
  end

  show do
    attributes_table do
      row "Question Text" do |ans|
        question = Question.find_by(id: ans.question_id)
        question&.text
      end
      row :text
      row :status
      
    end
  end

    
  form do |f|
    f.inputs 'Answer Details' do
      if f.object.new_record?
        unused_question_ids = Question.pluck(:id) - Answer.pluck(:question_id).compact
        f.input :question, as: :select, collection: Question.where(id: unused_question_ids).map { |q| [q.text, q.id] }
      else
        f.input :question, as: :string, input_html: { disabled: true }
      end
      
        f.input :text
        f.input :status
     
    end
  
    f.actions
  end


  
end
  

