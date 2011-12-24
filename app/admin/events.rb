ActiveAdmin.register Event do
  show :title => :title do
    panel "Images" do
      render :partial => "admin/event_images/index", :locals => { :images => event.event_images }
    end
  link_to "Add event image", new_admin_event_image_path
  end

  sidebar "Event Details", :only => :show do
    attributes_table_for event, :title, :description, :date
  end
end
