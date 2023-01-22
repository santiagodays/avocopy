class Copy
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :attachment, type: String
  mount_uploaders :attachment, AttachmentUploader
  validates :name, presence: true
end
