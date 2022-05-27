class Resume < ApplicationRecord

  validates :cover_letter, presence: true
  validates :attachment, presence: true

  belongs_to :job
  belongs_to :user
  after_commit :remove_previously_stored_attachment, on: :update
  mount_uploader :attachment, AttachmentUploader
  
end
