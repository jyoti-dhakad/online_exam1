ActiveAdmin.register Exam do

 permit_params :name, :start_date, :end_date, :duration, :status, :question_id, :question_type_id, :category_id, :answer_id

 
  scope 'Active', default: true do |exams|
   exams.where(status: false)
  end
 
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
    
    column "Question" do |ans|
      question = Question.find_by(id: ans.question_id)
      question&.text
    end
    if current_admin_user.admin?  
      column "Answer" do |ans|
        answer = Answer.find_by(id: ans.answer_id)
        answer&.text
      end
      
    end
    column :name
    column :start_date
    column :end_date
    column :duration
    column :status do |exam|
      status_tag(exam.status ? 'Active' : 'Inactive', class: exam.status ? 'yes' : 'no')
    end
    actions do |exam|
      if exam.status
        item 'Deactivate', deactivate_admin_exam_path(exam), method: :put, class: "deactivate-button"
      else
        item 'Activate', activate_admin_exam_path(exam), method: :put, class: "activate-button"
      end
    end

    
  end

  member_action :deactivate, method: :put do
    exam = Exam.find(params[:id])
    exam.update(status: false)
    redirect_back fallback_location: admin_exams_path, notice: "exam deactivated successfully."
  end

  member_action :activate, method: :put do
    exam = Exam.find(params[:id])
    exam.update(status: true)
    redirect_back fallback_location: admin_exams_path, notice: "exam activated successfully."
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
      row "Question" do |ans|
        question = Question.find_by(id: ans.question_id)
        question&.text
      end
    
      row "Answer" do |ans|
        answer = Answer.find_by(id: ans.answer_id)
        answer&.text
      end
      row :name
      row :start_date
      row :end_date
      row :duration
      row :status
      
      
    end
  end

    
  form do |f|
    f.inputs 'Questions Details' do
    
      f.input :category, as: :select, collection: Category.all.map { |c| [c.name, c.id] }
      
      f.input :question_type, as: :select, collection: QuestionType.all.map { |q| [q.name, q.id] }
      f.input :question, as: :select, collection: Question.all.map { |c| [c.text, c.id] }
      f.input :answer, as: :select, collection: Answer.all.map { |c| [c.text, c.id] }
      f.input :name
      f.input :start_date
      f.input :end_date
      f.input :duration

      
      
    
      f.actions
    end
  end
end


