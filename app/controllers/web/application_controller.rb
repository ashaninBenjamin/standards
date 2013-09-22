class Web::ApplicationController < ApplicationController
  helper_method :client_signed_in?, :current_client

  private

  def set_locale
    I18n.locale = I18n.default_locale
  end
end
