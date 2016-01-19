class Upload < ActiveRecord::Base
  has_many :tags, through: :links
  has_many :links
  belongs_to :user
  mount_uploader :file, FileUploader
end
