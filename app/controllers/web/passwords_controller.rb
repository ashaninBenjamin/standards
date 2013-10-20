class Web::PasswordsController < Web::ApplicationController
  def new
    @type = ClientNewPasswordType.new
  end

  def create
    @type = ClientNewPasswordType.new(params[:client_new_password_type])
    if @type.valid?
      client = @type.client
      client.generate_confirmation_token
      client.save!
      ClientPasswordMailer.reset_password_instructions(client).deliver
      redirect_to root_path
      f :success
    else
      render action: :new
    end
  end

  def edit
    return redirect_to(root_path) unless params[:confirmation_token]
    @client = Client.find_by! params.extract(:confirmation_token)
    @client = @client.becomes(ClientChangePasswordType)
  end

  def update
    return redirect_to(root_path) unless params[:confirmation_token]
    @client = Client.find_by! params.extract(:confirmation_token)
    @client = @client.becomes(ClientChangePasswordType)

    if @client.update(params[:client])
      sign_in @client
      redirect_to root_path
    else
      render action: :edit
    end
  end
end
