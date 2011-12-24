ActiveAdmin.register EventImage do
  filter :event

  index :as => :grid do |event_image|
    a :href => admin_event_image_path(event_image) do
      image_tag(event_image.thumbnail.url, :title => event_image.description)
    end
  end

  show do
    link_to image_tag(event_image.image.url), edit_admin_event_image_path(event_image)
  end

  form do |f|
    f.inputs do
      f.input :event
      f.input :description
      f.input :image, :as => :file
    end
    f.buttons
  end
end
