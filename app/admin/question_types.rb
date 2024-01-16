ActiveAdmin.register QuestionType do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :status
  #
  index do
    selectable_column
    id_column
    column "Question Type" do |ans|
      ans.name
    end
    column :status
   
    
    
    actions
  end

  show do
    attributes_table do
      row :name
      row :status
    
      
    end
  end

    
  form do |f|
    f.inputs 'Question_type Details' do
      f.input :name, as: :select, collection: QuestionType.names.values
      f.input :status
     
      f.actions
    end
  end
  
end
