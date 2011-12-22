ActiveAdmin.register Event do
  show :title => :title do
    panel "Images" do
      render :partial => "admin/event_images/show", :locals => {:images => event.event_images}
    end
  end

  sidebar "Event Details", :only => :show do
    attributes_table_for event, :title, :body, :date
  end
end
