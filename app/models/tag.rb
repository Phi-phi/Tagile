class Tag < ActiveRecord::Base
  has_many :uploads, through: :links
  has_many :links
  belongs_to :user
end
