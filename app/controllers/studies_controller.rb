class StudiesController < ApplicationController

  respond_to :html

  def index
  end

  def show
    @study = Study.find(params[:id])
    respond_with @study
  end

end
