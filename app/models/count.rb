class Count < ApplicationRecord
  # validation
  with_options presence: true do
    validates :name
    validates :category
    validates :release
    validates :image
  end    
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :release_id
  end
  # Association
  has_many :details
  accepts_nested_attributes_for :details, allow_destroy: true
  belongs_to :user 
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :release
end
