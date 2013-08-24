class Web::Admin::ClientsController < Web::Admin::ApplicationController
  def index
    @q = ::Client.ransack(params[:q])
    @clients = @q.result.page(params[:page]).per(params[:per_page])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client = @client.becomes(ClientType)
    if @client.update(params[:client])
      f :success
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def trigger_state_event
    @client = ::Client.find(params[:id])

    if @client.fire_state_event(params[:event])
      f(:success)
    else
      f(:error)
    end

    redirect_to action: :index
  end
end
