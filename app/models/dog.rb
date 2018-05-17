class Dog < ApplicationRecord
  belongs_to :user
  belongs_to :reservation, optional: true
  
  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: 25}
  validates :breed, presence: true
  validates :gender, presence: true
  validates :color, presence: true
  validates :age, presence: true, numericality: {less_than_or_equal_to: 20, only_integer: true}
end
