class PresentationsController < ApplicationController

    def create
        @presentation = Presentation.new(presentation_params)
        ids = user_ids[:users]
        ids.shift
        if ids.length <= 0
            render 'static_pages/home', status: :unprocessable_entity
        else
            if @presentation.save
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

    def destroy
    end

    private

        def user_ids
            params.require(:presentation).permit(:users => [])
        end 

        def presentation_params
            params.require(:presentation).permit(:name)
        end
end
