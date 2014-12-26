class AnswerGoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    @answer = Answer.find(params[:answer_id])
    current_user.answer_good!(@answer)
    @answer.user.update(point: @answer.user.point + 1)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    @answer = AnswerGood.find(params[:id]).answer
    current_user.unanswer_good!(@answer)
    @answer.user.update(point: @answer.user.point - 1)
     respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
