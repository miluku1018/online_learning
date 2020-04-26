class Admin::BaseController < ApplicationController
  before_action :authenticate_account!
  before_action :permission_check!
  layout 'backend'
  private
  def permission_check!
    if current_account.role != 'admin'
      redirect_to root_path, notice: '無法存取' 
    end
  end

end