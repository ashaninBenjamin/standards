class Web::HelpsController < Web::ApplicationController
  def new
    @help = HelpType.new
  end

  def create
    @help = HelpType.new(params[:help_type])
    if @help.valid?
      TechnicalSupportMailer.problem({name: @help.name, email: @help.email}, @help.subject, @help.message).deliver
      f :success
      redirect_to root_path
    else
      render action: :new
    end
  end
end
