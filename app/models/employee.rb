class Employee < ApplicationRecord
  
  has_many :reports
  
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save {self.email = email.downcase }
    validates :name, presence: true, length: {maximum: 50}
    validates :password, presence: true, length: {minimum: 6}
    validates :email, presence: true, length: {maximum: 200}, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
    
      has_secure_password
      
      def Employee.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
       BCrypt::Password.create(string, cost: cost)
      end
end
