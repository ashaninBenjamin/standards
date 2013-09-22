class Web::FeedsController < Web::ProtectedApplicationController
  def index
    @feeds = Feed.all
  end

  def show
    @feed = Feed.find(params[:id])
  end
end
