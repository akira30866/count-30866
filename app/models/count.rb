class Count < ApplicationRecord
  # validation
  validates :name, presence :true 
  with_options numericality: { other_than: 1 } do
    validate :category_id
    validate :release_id
  end
  # Association
  has_many :details
  belongs_to :user 
end
