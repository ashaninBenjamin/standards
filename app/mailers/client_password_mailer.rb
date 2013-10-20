class ClientPasswordMailer < ApplicationMailer

  def reset_password_instructions(client)
    @client = client
    mail to: @client.email
  end
end
