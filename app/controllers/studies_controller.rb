class StudiesController < ApplicationController

  respond_to :html

  def index
    @studies = Study.all
  end

  def show
    @study = Study.find(params[:id])
  end

end
