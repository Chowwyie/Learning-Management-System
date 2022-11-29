class AnnouncementsController < ApplicationController
    
    def index
        @announcements = Announcement.all
        @announcement = current_user.announcements.build()
    end

    def create
        @announcement = current_user.announcements.build(announcement_params)
        if @announcement.save
            flash[:success] = "Announcement created!"
            redirect_to announcements_path
        else
            @user = current_user
            render 'static_pages/home', status: :unprocessable_entity
        end
    end

    def edit
        @announcement = Announcement.find(params[:id])
    end

    def update
        @announcement = Announcement.find(params[:id])
        @announcement.update!(announcement_params)
        if @announcement.save
            flash[:success] = "Announcement updated!"
            redirect_to annoucements_path
        else
            render 'static_pages/home', status: :unprocessable_entity
        end
    end

    private
        def announcement_params
            params.require(:announcement).permit(:text)
        end
end