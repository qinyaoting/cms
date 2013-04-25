class Video < ActiveRecord::Base




  attr_accessible :title, :category, :cover, :url
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  #has_attached_file :url

  belongs_to :account
  validates_presence_of :title
  validates_presence_of :category
  mount_uploader :cover, AvatarUploader

end
