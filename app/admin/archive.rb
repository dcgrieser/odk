ActiveAdmin.register Archive do
  index do
    column :title
    column :created_at
    column :file do |a|
      link_to a.file.name, a.file.url
    end
    default_actions
  end

  show do
    render :partial => "admin/archives/show"
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :file, :as => :file
    end
    f.buttons
  end
end
