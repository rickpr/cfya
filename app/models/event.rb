class Event < ActiveRecord::Base
  has_many :member_events, dependent: :destroy
  has_many :members, through: :member_events
end
