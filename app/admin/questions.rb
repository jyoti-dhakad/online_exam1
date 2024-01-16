ActiveAdmin.register Question do

  permit_params :text, :category_id, :question_type_id, :status, options_attributes: [:id, :option_A, :option_B, :option_C, :option_D, :_destroy]

  #
  index do
    selectable_column
    id_column
    
    column "Category Name" do |ans|
      category = Category.find_by(id: ans.category_id)
      category&.name
    end
    column "Question type Name" do |ans|
      question_type = QuestionType.find_by(id: ans.question_type_id)
      question_type&.name
    end
    
    column :text
    column :status do |question|
      status_tag(question.status ? 'Active' : 'Inactive', class: question.status ? 'yes' : 'no')
    end
    actions do |question|
      if question.status
        item 'Deactivate', deactivate_admin_question_path(question), method: :put, class: "deactivate-button"
      else
        item 'Activate', activate_admin_question_path(question), method: :put, class: "activate-button"
      end
    end
  end

  member_action :deactivate, method: :put do
    question = Question.find(params[:id])
    question.update(status: false)
    redirect_back fallback_location: admin_questions_path, notice: "Question deactivated successfully."
  end

  member_action :activate, method: :put do
    question = Question.find(params[:id])
    question.update(status: true)
    redirect_back fallback_location: admin_questions_path, notice: "Question activated successfully."
  end

  show do
    attributes_table do
      row "Category Name" do |ans|
        category = Category.find_by(id: ans.category_id)
        
         category&.name
      end
      row "Question type Name" do |ans|
        question_type = QuestionType.find_by(id: ans.question_type_id)
        question_type&.name
      end
      row :text
      row :status
      
      panel 'Options' do
        table_for question.options.order(:id) do
          column 'Option A', :option_A
          column 'Option B', :option_B
          column 'Option C', :option_C
          column 'Option D', :option_D
        end
      end
    end
  end

    
  form do |f|
    f.inputs 'Questions Details' do
     
      f.input :category, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      
      f.input :question_type, as: :select, collection: QuestionType.all.map { |q| [q.name, q.id] }
      f.input :text
      f.input :status
      f.has_many :options, heading: 'Options', allow_destroy: true, new_record: 'Add Options' do |ops|
        ops.input :option_A
        ops.input :option_B
        ops.input :option_C
        ops.input :option_D
      end
      
    
      f.actions
    end
  end


  
end
