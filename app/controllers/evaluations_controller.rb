# frozen_string_literal: true

##
# Evaluation controller that controls all evaluation related manipulations and functions.
class EvaluationsController < ApplicationController
  before_action :authorize_student?, except: %i[index destroy]
  before_action :authorize_admin?, only: %i[index destroy]
  layout 'dashboard'

  def index; end

  def student; end

  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    @evaluation = Evaluation.find(params[:id])
    @evaluation.update(eval_params)
    @evaluation.submitted = true
    if @evaluation.save
      flash[:success] = 'Evaluation submitted!'
      redirect_to student_evaluation_path
    else
      flash[:danger] = 'Score must be from an integer from 0-10 and you must write an evaluation.'
      redirect_to edit_evaluation_path(@evaluation)
    end
  end

  def destroy
    Evaluation.find(params[:id]).destroy
    flash[:success] = 'Evaluation Unassigned'
    redirect_to evaluations_path
  end

  private

  def eval_params
    params.require(:evaluation).permit(:score, :evaluation)
  end
end
