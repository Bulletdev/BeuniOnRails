class GiftCampaign < ApplicationRecord
  belongs_to :organization
  has_many :gift_shipments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :budget_per_gift, presence: true, numericality: { greater_than: 0 }

  scope :active, -> { where(active: true) }

  def total_shipments
    gift_shipments.count
  end

  def total_budget_used
    gift_shipments.count * (budget_per_gift || 0)
  end
end