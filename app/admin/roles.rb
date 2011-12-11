ActiveAdmin.register Role do
  form do |f|
    f.inputs do
      f.input :user
      f.input :title, :as => :select, :collection => Role::TITLES
      f.input :term_start_year
    end
    f.buttons
  end
end
