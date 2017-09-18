class Room < ApplicationRecord
  before_create :set_uuid
  before_create :set_thema
  belongs_to :rule
  belongs_to :thema
  has_many :room_users
  has_many :users,through: :room_users

  def set_thema
    self.thema_id=Thema.where( 'id >= ?', rand(Thema.first.id..Thema.last.id) ).first.id
  end
end
