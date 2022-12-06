# frozen_string_literal: true

##
# static page rendering and authorization
class StaticPagesController < ApplicationController
  before_action :authorize_admin?, only: [:gradebook]
  layout 'dashboard', only: [:gradebook]

  ##
  # Renders home view.
  def home; end

  ##
  # Renders help view.
  def help; end

  ##
  # Renders about view.
  def about; end

  ##
  # Renders gradebook view.
  def gradebook; end

  ##
  # Renders contact view.
  def contact; end
end
