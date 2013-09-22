class Web::Admin::ApplicationController < ApplicationController
  helper_method :admin_signed_in?

  private

  def set_locale
    I18n.locale = I18n.default_locale
  end
end
