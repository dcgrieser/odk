ActiveAdmin.register Role do
  scope :all
  scope :current do
    Role.current
  end

  index do
    column :title
    column :term_start_year
    column :user
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :title, :as => :select, :collection => Role::TITLES
      f.input :term_start_year
    end
    f.buttons
  end
end
