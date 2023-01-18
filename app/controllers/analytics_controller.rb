class AnalyticsController < ApplicationController
  def index
    @analytics = Query.where(user: current_user).group(:body).order(count: :desc).count
  end
end
