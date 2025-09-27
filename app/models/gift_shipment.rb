class GiftShipment < ApplicationRecord
  belongs_to :organization
  belongs_to :employee
  belongs_to :gift_campaign

  validates :status, inclusion: { in: %w[scheduled processing sent delivered failed] }

  enum status: {
    scheduled: 'scheduled',
    processing: 'processing',
    sent: 'sent',
    delivered: 'delivered',
    failed: 'failed'
  }

  scope :pending, -> { where(status: ['scheduled', 'processing']) }
  scope :completed, -> { where(status: ['sent', 'delivered']) }
  scope :this_month, -> { where(scheduled_date: Date.current.beginning_of_month..Date.current.end_of_month) }

  def days_until_shipment
    return 0 unless scheduled_date

    (scheduled_date - Date.current).to_i
  end

  def overdue?
    scheduled_date && scheduled_date < Date.current && !sent? && !delivered?
  end
end