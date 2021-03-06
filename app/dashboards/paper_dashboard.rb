require "administrate/base_dashboard"

class PaperDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    committee: Field::BelongsTo,
    reviews: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    author: Field::String,
    attachment: Field::String,
    conference_id: Field::Number,
    authorid: Field::Number,
    rating: Field::String.with_options(searchable: false),
    accepted: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :committee,
    :reviews,
    :id,
    :title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :committee,
    :reviews,
    :id,
    :title,
    :author,
    :attachment,
    :conference_id,
    :authorid,
    :rating,
    :accepted,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :committee,
    :reviews,
    :title,
    :author,
    :attachment,
    :conference_id,
    :authorid,
    :rating,
    :accepted,
  ].freeze

  # Overwrite this method to customize how papers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(paper)
  #   "Paper ##{paper.id}"
  # end
end
