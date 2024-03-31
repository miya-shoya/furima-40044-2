class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :situation
  belongs_to_active_hash :cost
  belongs_to_active_hash :region
  belongs_to_active_hash :delivery_day
  validates :name, :image, :price, :info, :category_id, :situation_id, :cost_id, :region_id, :delivery_day_id, presence: true
  validates :price, numericality: { less_than: 9_999_999, greater_than: 300 }

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :situation_id
    validates :cost_id
    validates :region_id
    validates :delivery_day_id
  end

  belongs_to :user
  has_one_attached :image
 end

