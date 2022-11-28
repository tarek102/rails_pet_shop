class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_items, dependent: :destroy
  has_many :items, through: :group_items

  validates :name, presence: true
  validates :icon, presence: true
end
