# frozen_string_literal: true

##
# Announcement controller that controls all announcement related manipulations and functions.
class AnnouncementsController < ApplicationController
  before_action :authorize_admin?, only: %i[create edit update]
  before_action :authorize_user?, only: [:index]
  layout 'dashboard'

  def index
    @announcements = Announcement.all
    # builds a @announcement that is used by the announcement form for params
    @announcement = current_user.announcements.build
  end

  def create
    # creates and modifies params for a new announcement on the current_user
    @announcement = current_user.announcements.build(announcement_params)
    if @announcement.save
      flash[:success] = 'Announcement created!'
      redirect_to announcements_path
    else
      flash[:danger] = "Can't have a blank announcement."
      redirect_to announcements_path, status: :unprocessable_entity
    end
  end

  def edit
    # finds the announcement to modify
    @announcement = Announcement.find(params[:id])
  end

  def update
    # finds the announcement to modify, updates it with params
    @announcement = Announcement.find(params[:id])
    @announcement.update!(announcement_params)
    if @announcement.save
      flash[:success] = 'Announcement updated!'
      redirect_to annoucements_path
    else
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
    Announcement.find(params[:id]).destroy
    flash[:success] = 'Annoucement Erased'
    redirect_to announcements_path
  end

  private

  def announcement_params
    params.require(:announcement).permit(:text)
  end
end
