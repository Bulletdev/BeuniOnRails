class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organization

  def index
    @employees_count = @organization.employees.active.count
    @birthday_this_month = @organization.employees.active.birthday_this_month.count
    @pending_shipments = @organization.gift_shipments.pending.count
    @recent_shipments = @organization.gift_shipments.includes(:employee, :gift_campaign)
                                   .order(created_at: :desc).limit(5)
    @upcoming_birthdays = @organization.employees.active
                                     .where(
                                       birth_date: Date.current.beginning_of_month..Date.current.end_of_month
                                     ).order(:birth_date).limit(10)
  end

  private

  def set_organization
    @organization = current_user.organization
  end
end