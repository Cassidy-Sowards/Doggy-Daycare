class Reservation < ApplicationRecord
  
  
  belongs_to :user
  belongs_to :dog, required: false
  belongs_to :kennel, required: false
  has_many :reports, dependent: :destroy
  
  validate :startdate_not_in_past
  validate :enddate_not_in_past
  validates :enddate, presence: true 
  validates :status, presence: true
  
  
  def startdate_not_in_past
    if startdate < DateTime.current
      errors.add(:startdate, "can't be in the past")
    end
  end
  
  def enddate_not_in_past 
    if enddate < DateTime.current
      errors.add(:enddate, "can't be in the past")
    end
  end
  
end
