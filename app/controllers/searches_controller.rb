class SearchesController < ApplicationController
  before_action :authenticate_end_user!

  def search
    @search_results = Facility.where("area_name LIKE ?", "%#{params[:search]}%")
  end
end
