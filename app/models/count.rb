class Count < ApplicationRecord
  # validation
  with_options presence: true do
    validates :name
    validates :category
    validates :release
    validates :image
  end    
  with_options numericality: { other_than: 1 } do
    validate :category_id
    validate :release_id
  end
  # Association
  has_many :details
  belongs_to :user 
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :release
end
