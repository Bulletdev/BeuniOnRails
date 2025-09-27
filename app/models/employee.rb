class Employee < ApplicationRecord
  belongs_to :organization
  has_many :gift_shipments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :birth_date, presence: true
  validates :cpf, presence: true, uniqueness: { scope: :organization_id }

  before_validation :format_cpf, :format_phone, :format_zip_code

  scope :active, -> { where(active: true) }
  scope :birthday_this_month, -> { where(birth_date: Date.current.beginning_of_month..Date.current.end_of_month) }
  scope :by_department, ->(dept) { where(department: dept) if dept.present? }

  def age
    return nil unless birth_date

    today = Date.current
    age = today.year - birth_date.year
    age -= 1 if today < birth_date + age.years
    age
  end

  def birthday_this_month?
    return false unless birth_date

    Date.current.month == birth_date.month
  end

  def full_address
    return "" if street.blank?

    address_parts = [street]
    address_parts << number if number.present?
    address_parts << complement if complement.present?
    address_parts << neighborhood if neighborhood.present?
    address_parts << city if city.present?
    address_parts << state if state.present?
    address_parts << zip_code if zip_code.present?

    address_parts.join(", ")
  end

  private

  def format_cpf
    self.cpf = cpf.gsub(/\D/, '') if cpf.present?
  end

  def format_phone
    self.phone = phone.gsub(/\D/, '') if phone.present?
  end

  def format_zip_code
    self.zip_code = zip_code.gsub(/\D/, '') if zip_code.present?
  end
end