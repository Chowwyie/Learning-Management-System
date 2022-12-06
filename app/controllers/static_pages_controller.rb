# frozen_string_literal: true

##
# static page rendering and authorization
class StaticPagesController < ApplicationController
  before_action :authorize_admin?, only: [:gradebook]
  layout 'dashboard', only: [:gradebook]

  def home; end

  def help; end

  def about; end

  def gradebook; end

  def contact; end
end
