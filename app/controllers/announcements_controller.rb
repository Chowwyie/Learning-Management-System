class AnnouncementsController < ApplicationController
    before_action :authorize_admin?, only: [:create, :edit, :update]
    before_action :authorize_user?, only: [:index]
    layout "dashboard"

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
            flash[:danger] = "Can't have a blank announcement."
            redirect_to announcements_path, status: :unprocessable_entity
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

    def destroy
        Announcement.find(params[:id]).destroy
        flash[:success] = "Annoucement Erased"
        redirect_to announcements_path
    end
    
    private
        def announcement_params
            params.require(:announcement).permit(:text)
        end
end