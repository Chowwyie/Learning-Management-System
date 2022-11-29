class PresentationsController < ApplicationController
    def index 
        @presentations = Presentation.all
    end 

    def new
        @presentation = Presentation.new
    end

    def create
        @presentation = Presentation.new(presentation_params)
        ids = user_ids[:users]
        ids.shift
        if @presentation.save
            ids.each do |id|
                @presentation.users << User.find(id)
            end
            assign_evaluations(@presentation)
            flash[:success] = "Presentation created!"
            redirect_to new_presentation_path
        else
            # flash[:danger] = "Failure not saved"
            @user = current_user
            render "presentations/new", status: :unprocessable_entity
        end
    end
  
    def edit
        @presentation = Presentation.find(params[:id])
    end

    def update
        @presentation = Presentation.find(params[:id])
        if @presentation.update(presentation_params)
            flash[:success] = "Presentation updated!"
            redirect_to presentations_path
        else
            render 'static_pages/home', status: :unprocessable_entity
        end
    end

    def show
        @presentation = Presentation.find(params[:id])
    end 

    def student
    end 

    def destroy
    end

    private

        def user_ids
            params.require(:presentation).permit(:users => [])
        end 

        def presentation_params
            params.require(:presentation).permit(:name, :pointvalue, :duedate, :grade)
        end

        def assign_evaluations(presentation)
            users = User.all
            users.each do |user|
                # if user is a student who did not present
                if presentation.users.exclude?(user) && !user.admin
                    # automatically sends evaluations to each user due a week from the presentation date.
                    eval = Evaluation.new(presentation_id: presentation.id, user_id: user.id, duedate: presentation.duedate + 604800)
                    eval.save
                end
            end
        end
end
