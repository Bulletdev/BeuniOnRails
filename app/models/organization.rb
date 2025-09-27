class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :employees, dependent: :destroy
  has_many :gift_campaigns, dependent: :destroy
  has_many :gift_shipments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :cnpj, presence: true, uniqueness: true

  before_validation :format_cnpj

  scope :active, -> { where(active: true) }

  private

  def format_cnpj
    self.cnpj = cnpj.gsub(/\D/, '') if cnpj.present?
  end
end