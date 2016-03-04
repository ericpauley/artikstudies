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
    current_user.study = @study
    redirect_to action: :show, id: @study.id
  end

  def join
    if !current_user.study
      @study = Study.find(params[:id])
      current_user.study = @study
      current_user.save
      redirect_to action: :show, id: @study.id
    else
      redirect_to "/"
    end
  end

  def leave
    @study = Study.find(params[:id])
    if current_user.study == @study
      current_user.study = nil
      current_user.save
      redirect_to action: :show, id: @study.id
    end
  end

  def show
    @study = Study.find(params[:id])
  end

  private
  def study_params
    params.require(:study).permit(:name, :start, :end, :description, instructions_attributes: [:id, :name, :description])
  end

end
