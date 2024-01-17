# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    
    
    
    if current_admin_user.user?
      div class: "user_exam_details" do
        h3 "Exam Details"
        p "Click below to view all available exams:"
        span link_to("View All Exams", admin_exams_path)
      end
    
    end
  end
  
end
