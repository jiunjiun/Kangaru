class AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!

  expose :company, -> { current_user.company }
end
