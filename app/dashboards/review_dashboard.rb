require "administrate/base_dashboard"

class ReviewDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    paper: Field::BelongsTo,
    id: Field::Number,
    score: Field::Number,
    confidence: Field::Number,
    comments: Field::Text,
    memberid: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :paper,
    :id,
    :score,
    :confidence,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :paper,
    :id,
    :score,
    :confidence,
    :comments,
    :memberid,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :paper,
    :score,
    :confidence,
    :comments,
    :memberid,
  ].freeze

  # Overwrite this method to customize how reviews are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(review)
  #   "Review ##{review.id}"
  # end
end
