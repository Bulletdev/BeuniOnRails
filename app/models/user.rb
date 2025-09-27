class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization

  validates :name, presence: true, length: { minimum: 2 }
  validates :role, inclusion: { in: %w[admin member] }

  enum role: { member: 'member', admin: 'admin' }

  scope :admins, -> { where(role: 'admin') }
  scope :members, -> { where(role: 'member') }

  def admin?
    role == 'admin'
  end

  def full_name
    name
  end
end