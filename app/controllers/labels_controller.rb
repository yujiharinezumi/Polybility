class LabelsController < ApplicationController
  before_action :set_label,only: [:destroy]
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to labels_path,success:"ラベルを作成しました。"
    else
      render :new
    end
  end

  def destroy
    @label.destroy
    redirect_to labels_path,notice:"ラベルを削除しました。"
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end

  def set_label
    @label = Label.find(params[:id])
  end
end
