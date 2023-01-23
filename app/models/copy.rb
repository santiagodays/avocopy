class Copy
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :attachment, type: String
  validates :name, presence: true
  mount_uploader :attachment, AttachmentUploader
end
