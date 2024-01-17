ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email,  :first_name, :last_name, :gender, :collage_name, :mobile_number, :address
  
  actions :index, :show, :destroy
  
  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :gender
    column :collage_name
    column :mobile_number
    column :address
    
    actions
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :gender
      row :collage_name
      row :mobile_number
      row :address
      
    end
  end

  
end
