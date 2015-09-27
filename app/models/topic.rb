class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks

  validates :title, length: { minimum: 5 }, presence: true
end
