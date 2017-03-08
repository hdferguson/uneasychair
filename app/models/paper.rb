class Paper < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :title,  :attachment, presence: true# Make sure the owner's name is present.
  validates :title, uniqueness: true
  validates :attachment, allow_blank: true, format: {
    with: %r{\.(doc|docx|pdf)\Z}i,
    message: 'must be a URL for DOC, DOCX or PDF image.'
    }
  #has_many:reviews

end

