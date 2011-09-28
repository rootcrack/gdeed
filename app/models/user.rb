class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_one :sponsor
  has_one :charity
  has_many :purchases, :foreign_key => :donor_id
  
  has_attached_file :logo, 
                    :styles => { :medium => "300x300>", :thumb => "80x80>" }
  validates_attachment_content_type :logo, 
                    :content_type => /image\/.*/, :message => "File must be an image"
                    
  validates :username, :uniqueness => true

  attr_accessor :login
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :name, :zipcode, :logo
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20], :username => data["email"]) 
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end
  
  def is_a_sponsor?
    sponsor
  end
  
  def is_a_charity?
    charity
  end
  
  def is_admin?
    username == "admin"# || is_admin?
  end
  
  protected

   def self.find_for_database_authentication(warden_conditions)
     conditions = warden_conditions.dup
     login = conditions.delete(:login)
     where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
   end
end
