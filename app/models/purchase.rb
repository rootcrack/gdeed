class Purchase < ActiveRecord::Base
  validates_presence_of :name, :amount, :address, :city, :state, :zipcode, :email, :card_verification, :card_expires_on, :card_number
  validates_inclusion_of :status, :in => ['pending','processing','paid']
  validates_numericality_of :amount
  belongs_to :user
  
  attr_accessor :card_number, :card_verification
  
  belongs_to :deed
  belongs_to :user, :foreign_key => :donor_id

  scope :pending, lambda{
    where("status = 'pending'")
  }
  
  scope :processing, lambda{
    where("status = 'processing'")
  }
  
  scope :paid, lambda{
    where("status = 'paid'")
  }
end
