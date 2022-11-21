class PresentationsController < ApplicationController
    def create
        @presentation = Presentation.new(presentation_params)
        ids = user_ids[:users]
        ids.shift
        if ids.length <= 0
            render 'static_pages/home', status: :unprocessable_entity
        else
            if @presentation.save
                assign_evaluations(@presentation.id, ids)
                flash[:success] = "Presentation created!"
                ids.each do |id|
                    @presentation.users << User.find(id)
                end
                redirect_to root_url
            else
                render 'static_pages/home', status: :unprocessable_entity
            end
        end
    end
  
    def edit
        @presentation = Presentation.find(params[:id])
    end

    def update
        @presentation = Presentation.find(params[:id])
        @presentation.submitted = true
        if @presentation.save
            flash[:success] = "Presentation submitted!"
            redirect_to root_url
        else
            render 'static_pages/home', status: :unprocessable_entity
        end
    end

    def destroy
    end

    private

        def user_ids
            params.require(:presentation).permit(:users => [])
        end 

        def presentation_params
            params.require(:presentation).permit(:name)
        end

        def assign_evaluations(presentation_id, presentation_user_ids)
            users = User.all
            users.each do |user|
                if presentation_user_ids.exclude?(user.id.to_s) && !user.admin
                    eval = Evaluation.new( presentation_id: presentation_id, user_id: user.id)
                    eval.save
                end
            end
        end
end
