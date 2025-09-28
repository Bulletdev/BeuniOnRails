class HomeController < ApplicationController
  # Permite acesso sem autenticação
  skip_before_action :authenticate_user!

  # Usa layout específico para home
  layout 'home'

  def index
    # Se o usuário estiver logado, redireciona para o dashboard
    if user_signed_in?
      redirect_to dashboard_path
    end
  end
end
