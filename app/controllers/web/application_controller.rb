class Web::ApplicationController < ApplicationController
  helper_method :client_signed_in?, :current_client
end
