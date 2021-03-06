class Book < ApplicationRecord
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :user
  has_many :sales
  has_attached_file :image
  has_attached_file :resource
  
  validates_numericality_of :price,
  greater_than: 49, message: "Must be at least 50 cents"
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment :resource, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }


end
