class Bookmark < ActiveRecord::Base

  validates :url,
            format: URI::regexp(%w(http https)),
            presence: true

  belongs_to :topic
  belongs_to :user
end
