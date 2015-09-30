class Bookmark < ActiveRecord::Base

  # validates :url,
  #           format: URI::regexp(%w(http https)),
  #           presence: true
  #
  # validates :topic_id, presence: true

  belongs_to :topic
  belongs_to :user

  has_many :likes, dependent: :destroy
end
