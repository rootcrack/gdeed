class Deed < ActiveRecord::Base
  belongs_to :sponsor, :foreign_key => :sponsor_id
  belongs_to :charity, :foreign_key => :charity_id
  validates_inclusion_of :status, :in => ['pending','active','completed','cancelled']
  validates_presence_of :amount, :price, :target_amount
  
  scope :active, lambda {
    where("status = 'active'")
  }
  
  scope :pending, lambda {
    where("status = 'pending'")
  }
  
  scope :completed, lambda {
    where("status = 'completed'")
  }
  
  scope :unexpired, lambda {
    active.where("ends_on IS NOT NULL OR ends_on > ?", Time.now)
  }
  
  def is_pending?
    status == 'pending'
  end
  
  def set_status(status)
    update_attributes(:status => status)
  end
  
  def contribution
    amount / target_amount
  end
  
end