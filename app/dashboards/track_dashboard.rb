require "administrate/base_dashboard"

class TrackDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    conference: Field::BelongsTo,
    id: Field::Number,
    role: Field::String,
    userid: Field::Number,
    capproved: Field::Boolean,
    uapproved: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :conference,
    :id,
    :role,
    :userid,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :conference,
    :id,
    :role,
    :userid,
    :capproved,
    :uapproved,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :conference,
    :role,
    :userid,
    :capproved,
    :uapproved,
  ].freeze

  # Overwrite this method to customize how tracks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(track)
  #   "Track ##{track.id}"
  # end
end
