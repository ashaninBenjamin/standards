class Web::Admin::ProtectedApplicationController < Web::Admin::ApplicationController
  before_filter :authenticate_admin!
end
