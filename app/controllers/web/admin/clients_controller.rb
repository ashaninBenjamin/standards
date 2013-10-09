class Web::Admin::ClientsController < Web::Admin::ProtectedApplicationController
  def index
    @q = ::Client.ransack(params[:q])
    @clients = @q.result.page(params[:page]).per(params[:per_page])
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
