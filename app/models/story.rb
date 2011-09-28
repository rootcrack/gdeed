class Story < ActiveRecord::Base
  scope :published, lambda{
    where("is_published = true")
  }
end
