class ApplicationController < ActionController::Base
  before_filter :set_locale

  protect_from_forgery

  include Concerns::FlashHelper
  include Concerns::AuthManagment
  include Concerns::ParamsManagment

  private

  def set_locale
    I18n.locale = I18n.default_locale
  end
end
