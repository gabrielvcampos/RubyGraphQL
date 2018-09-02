class User < ApplicationRecord
  has_many :posts
  has_many :comments 
  has_many :sessions, dependent: :destroy
  
  has_secure_password

  def full_name
    [self.first_name, self.last_name].compact.join ' '
  end

  def full_address
    [self.street, self.number, self.postcode, self.country].compact.join ', '
  end

  validates :first_name, :last_name, :street, :number, :city, :postcode, :country, presence: true
  
end
