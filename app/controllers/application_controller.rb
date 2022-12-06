# frozen_string_literal: true

##
# Parent controller that all controllers inherit from
class ApplicationController < ActionController::Base
  include SessionsHelper
end
