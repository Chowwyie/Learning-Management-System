# frozen_string_literal: true

##
# Presentation controller that controls all presentation related manipulations and functions.
class PresentationsController < ApplicationController
  before_action :authorize_admin?, only: %i[index new create edit update]
  before_action :authorize_student?, only: [:student]
  before_action :authorize_user?, only: [:show]
  layout 'dashboard'

  def index
    @presentations = Presentation.all
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)
    ids = user_ids[:users]
    # shifts off the first nil the html form provides.
    ids.shift
    if @presentation.save
        # handles next transactions
      create_presentation_users(ids)
      redirect_to new_presentation_path
    else
      @user = current_user
      render 'presentations/new', status: :unprocessable_entity
    end
  end

  def edit
    @presentation = Presentation.find(params[:id])
  end

  def update
    @presentation = Presentation.find(params[:id])
    if @presentation.update(presentation_params)
      flash[:success] = 'Presentation updated!'
      redirect_to presentations_path
    else
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  ##
  # Renders student view of presentations.
  def student; end

  def destroy
    name = Presentation.find(params[:id]).name
    Presentation.find(params[:id]).destroy
    flash[:success] = "Presentation #{name} deleted"
    redirect_to presentations_path
  end

  private

  ##
  # Given a list of user ids, adds the corresponding users to @presentation.
  # Broadcasts evaluations to all non-team members with a deadline in a week.
  #
  # Ensures: for all id in ids, id is in @presentation.users
  def create_presentation_users(ids)
    ids.each do |id|
      @presentation.users << User.find(id)
    end
    assign_evaluations(@presentation)
    flash[:success] = 'Presentation created!'
  end

  def user_ids
    params.require(:presentation).permit(users: [])
  end

  def presentation_params
    params.require(:presentation).permit(:name, :pointvalue, :duedate, :grade)
  end

  ##
  # Given a presentation,broadcasts evaluations to all non-team members and non-admins
  # with a deadline in a week after the presentation.
  #
  # Ensures: for user in presentation.users, user does not get a evaluation.
  # if user not in presentation.users and not admin, gets a evaluation assigned.
  def assign_evaluations(presentation)
    users = User.all
    presentation_users_ids = presentation.users.map(&:id)
    users.each do |user|
      # if user is a student who did not present
      next unless presentation_users_ids.exclude?(user.id) && !user.admin

      # automatically sends evaluations to each user due a week from the presentation date.
      eval = Evaluation.new(presentation_id: presentation.id, user_id: user.id,
                            duedate: presentation.duedate + 604_800)
      eval.save
    end
  end
end
