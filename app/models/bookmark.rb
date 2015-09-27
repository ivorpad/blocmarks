class Bookmark < ActiveRecord::Base

  validates :url,
            format: URI::regexp(%w(http https)),
            presence: true,
            uniqueness: true

  belongs_to :topic
end
