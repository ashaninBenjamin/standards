class Web::Admin::SessionsController < Web::Admin::ApplicationController
  def new
    @session = AdminSignInType.new
  end

  def create
    @session = AdminSignInType.new(params[:admin_sign_in_type])

    if @session.valid?
      admin = @session.admin
      sign_in admin
      f(:success)
      redirect_to admin_root_path
    else
      f(:error)
      render action: :new
    end
  end

  def destroy
    admin_sign_out
    redirect_to root_path
  end
end
