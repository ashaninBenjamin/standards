class Web::SessionsController < Web::ApplicationController
  def new
    @session = ClientSignInType.new
  end

  def create
    @session = ClientSignInType.new(params[:client_sign_in_type])

    if @session.valid?
      client = @session.client
      sign_in client
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    client_sign_out
    redirect_to root_path
  end
end
