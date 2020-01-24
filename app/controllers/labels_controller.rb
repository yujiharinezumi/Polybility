class LabelsController < ApplicationController
  before_action :set_label,only: [:destroy]
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to labels_path,success: t('labels.created')
    else
      render :new
    end
  end

  def destroy
    @label.destroy
    redirect_to labels_path,notice: t('labels.deleted')
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end

  def set_label
    @label = Label.find(params[:id])
  end
end
