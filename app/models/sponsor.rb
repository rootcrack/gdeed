class Sponsor < ActiveRecord::Base
  belongs_to :user
  has_many :deeds
  validates_presence_of :address, :name, :state, :city, :zipcode, :contact_phone
  
  scope :active, lambda {
    where("is_verified = true")
  }
  
  def deny
    update_attributes(:is_verified => false)
  end
  
  def verify
    update_attributes(:is_verified => true)
  end
end
