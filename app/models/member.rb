class Member < ActiveRecord::Base
  has_many :member_events, dependent: :destroy
  has_many :events, through: :member_events
  enum category: [:ysa, :adult]
end
