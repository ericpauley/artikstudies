class StudiesController < ApplicationController

  respond_to :html

  def index
    @studies = Study.all
  end

  def new
    @study = Study.new
    4.times { @study.instructions.build}
  end

  def edit
    @study = Study.find(params[:id])
    if @study.user != current_user
      redirect_to "/"
      return
    end
    4.times { @study.instructions.build}
  end

  def update
    @study = Study.find(params[:id])
    if @study.user != current_user
      redirect_to "/"
      return
    end
    @study.update(study_params)
    redirect_to action: :show, id: @study.id
  end

  def create
    @study = Study.new(study_params)
    @study.user_id = current_user.id
    @study.save
    current_user.study_id = @study.id
    redirect_to action: :show, id: @study.id
  end

  def show
    @study = Study.find(params[:id])
  end

  private
  def study_params
    params.require(:study).permit(:name, :start, :end, :description, instructions_attributes: [:id, :name, :description])
  end

end
