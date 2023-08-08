class Post < ApplicationRecord
  validate :image_presence
  has_one_attached :image

  belongs_to :user,optional: true

  has_many :likes,dependent: :destroy

  has_many :comments,dependent: :destroy

  def image_presence
    errors.add(:image,"can't be blank")unless image.attached?
  end

  
end























# def self.find_for_database_authentication(warden_conditions)
#   conditions = warden_conditions.dup
#   login = conditions.delete(:login)
#   where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
# end
# def serialised
#   {
#     id: self.id,
#     user: self.user.username,
#     image: self.image_url,
#     # likes: self.likes[0].like_count
#   }
# end



# def notify_pusher
#   Pusher.trigger('post', 'new', self.serialised)
# end
