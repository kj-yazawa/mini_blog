class Blog < ApplicationRecord
  extend Enumerize
  has_many :entries
  validates :title, presence: true
  
  enumerize :category, in: {tech: 1, life: 2, animal: 3, others: 4}, default: :others
  mount_uploader :avatar, AvatarUploader
  serialize :avatar, JSON
end
