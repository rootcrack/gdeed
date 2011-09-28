class Charity < ActiveRecord::Base
  belongs_to :user
  has_many :deeds
  validates_presence_of :name
end
