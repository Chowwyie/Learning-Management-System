class EvaluationsController < ApplicationController
    def edit
        @evaluation = Evaluation.find(params[:id])
    end

    def update
        @evaluation = Evaluation.find(params[:id])
        @evaluation.update!(eval_params)
        @evaluation.submitted = true
        if @evaluation.save
            flash[:success] = "Evaluation submitted!"
            redirect_to root_url
        else
            render 'static_pages/home', status: :unprocessable_entity
        end
    end

    private
        def eval_params
            params.require(:evaluation).permit(:score, :evaluation)
        end
end
