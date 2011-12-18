ActiveAdmin.register User do
  scope :all, :default => true
  scope :students do
    User.where(:type => User::STUDENT)
  end
  scope :faculty do
    User.where(:type => User::FACULTY)
  end
  scope :tappees
  scope :current
  scope :initiated
  scope :current_officers

  filter :first_name
  filter :last_name
  filter :email

  index do
    column :last_name
    column :first_name
    column :email
    column :title
    column :initiation_date
    column :type
    column :active
    column :image do |u|
      if u.image.present?
        link_to "image", u.image.url
      end
    end
    default_actions
  end

  show :title => :name do
    panel "Details" do
      attributes_table_for user, *(user.attributes.keys - ["password_digest", "id"])
    end

    if user.roles.present?
      panel "Roles" do
        user.roles.each do |role|
          attributes_table_for role, *(role.attributes.keys - ["id"])
        end
      end
    end

    if user.image.present?
      panel "Image" do
        image_tag user.image.url
      end
    end
  end

  form do |f|
    f.inputs "details" do
      f.input :last_name
      f.input :first_name
      f.input :email
      f.input :title
      f.input :password, :input_html => {:value => nil, :autocomplete => :off}
      f.input :initiation_date
      f.input :type, :as => :select, :collection => User::TYPES
      f.input :active
    end

    f.inputs "image" do
      if f.object.image.present?
        f.input :remove_image, :as => :boolean
      end
      f.input :image, :as => :file
    end
    f.buttons
  end
end
