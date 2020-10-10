class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout :layout_by_resource

  before_action :user_manager?

  def user_manager?
   if request.controller_class == ClientesController || request.controller_class == FuncionariosController
     unless current_user.manager
       redirect_to root
     end
   end
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "login"
    else
      "application"
    end
  end
end
