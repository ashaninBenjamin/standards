module Concerns
  module AuthManagment
    def sign_in(user)
      session[user.class.model_name.to_s] ||= user.id
    end

    def admin_sign_out
      session[admin] = nil
    end

    def current_admin
      @current_admin ||= Admin.where(id: session[admin]).first
    end

    def admin_signed_in?
      session[admin]
    end

    def authenticate_admin!
      unless admin_signed_in?
        redirect_to new_admin_session_path
      end
    end

    def client_sign_out
      session[client] = nil
    end

    def current_client
      @current_client ||= Client.where(id: session[client]).first
    end

    def client_signed_in?
      session[client]
    end

    def authenticate_client!
      unless client_signed_in?
        redirect_to new_session_path
      end
    end

    private

    def admin
      ::Admin.model_name.to_s
    end

    def client
      ::Client.model_name.to_s
    end
  end
end
