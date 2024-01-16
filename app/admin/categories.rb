ActiveAdmin.register Category do

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
    column "Question Category" do |ans|
      ans.name
    end
    column :status do |category|
      status_tag(category.status ? 'Active' : 'Inactive', class: category.status ? 'yes' : 'no')
    end
    
    actions do |category|
      if category.status
        item 'Deactivate', deactivate_admin_category_path(category), method: :put, class: "deactivate-button"
      else
        item 'Activate', activate_admin_category_path(category), method: :put, class: "activate-button"
      end
    end
  end
    member_action :deactivate, method: :put do
      category = Category.find(params[:id])
      category.update(status: false)
      redirect_back fallback_location: admin_categories_path, notice: "Category deactivated successfully."
    end
    
    member_action :activate, method: :put do
      category = Category.find(params[:id])
      category.update(status: 'active')
      redirect_back fallback_location: admin_categories_path, notice: "Category activated successfully."
    end
    
  

  show do
    attributes_table do
      row :name
      row :status
    
      
    end
  end

    
  form do |f|
    f.inputs 'Category Details' do
      f.input :name, as: :select, collection: Category.names.values
      f.input :status
      
      f.actions
    end
  end
  
end
