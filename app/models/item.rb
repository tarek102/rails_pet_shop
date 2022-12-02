class Item < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :group_items, dependent: :destroy
  has_many :groups, through: :group_items

  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, numericality: { greater_than: 0 }
  validates :groups, presence: true
end
