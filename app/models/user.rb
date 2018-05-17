class User < ApplicationRecord

has_many :dogs, dependent: :destroy
has_many :reservations 


    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: {maximum: 50}
    validates :address, length: {maximum: 200}
    validates :city, length: {maximum: 100}
    validates :state, length: {maximum: 3}
    validates :zip, length: {maximum: 5}
    validates :phone, length: {maximum: 10}
    validates :password, presence: true, length: {minimum: 6}
    validates :email, presence: true, length: {maximum: 200}, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
    
    
      has_secure_password
      
      def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
       BCrypt::Password.create(string, cost: cost)
      end
  
    
end 
