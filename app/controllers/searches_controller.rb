class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model  == "end_user"
      @records = EndUser.search_for(@content, @method)
    else
      @records = Facility.search_for(@content, @method)
    end
  end
end
