class Video < ActiveRecord::Base




  attr_accessible :title, :category, :cover, :url

  mount_uploader :cover, AvatarUploader

  belongs_to :account
  validates_presence_of :title
  validates_presence_of :category
  VIDEO_CATEGORIES = [
      ["Baby", "baby"],
      ["Animal", "animal"],
      ["Beauty", "beauty"],
      ["Car", "car"],
      ["Bullman", "bullman"],
      ["Weekly", "weekly"],
      ["Cartoon", "cartoon"],
      ["Mystery", "mystery"],
      ["Art", "art"]
  ]
end
