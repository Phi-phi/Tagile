class Link < ActiveRecord::Base
  belongs_to :upload
  belongs_to :tag
end
