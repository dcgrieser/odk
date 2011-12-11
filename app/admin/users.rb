ActiveAdmin.register User do
  index do
    column :last_name
    column :first_name
    column :email
    column :title
    column :initiation_date
    column :type
    column :active
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :last_name
      f.input :first_name
      f.input :email
      f.input :title
      f.input :initiation_date
      f.input :type, :as => :select, :collection => User::TYPES
      f.input :active
    end
    f.buttons
  end
end
