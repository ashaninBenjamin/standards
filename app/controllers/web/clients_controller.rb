class Web::ClientsController < Web::ApplicationController
  before_filter :authenticate_client!, only: [:edit, :update]

  def new
    @client = ClientType.new
  end

  def create
    @client = ClientType.new(params[:client])
    if @client.save
      sign_in @client
      RegistrationMailer.information(@client.email).deliver
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
    @client = current_client
    @client = @client.becomes(ClientType)
  end

  def update
    @client = current_client
    @client = @client.becomes(ClientType)
    if @client.update(params[:client])
      redirect_to action: :edit
    else
      render action: :edit
    end
  end
end
