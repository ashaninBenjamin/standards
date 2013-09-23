class Web::Admin::FeedsController < Web::Admin::ProtectedApplicationController
  def index
    @q = Feed.ransack(params[:q])
    @feeds = @q.result.page(params[:page]).per(params[:per_page])
  end

  def new
    @feed = FeedType.new
  end

  def create
    @feed = FeedType.new(params[:feed])
    if @feed.save
      f :error
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @feed = Feed.find(params[:id])
  end

  def edit
    @feed = FeedType.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:id])
    @feed = @feed.becomes(FeedType)
    if @feed.update(params[:feed])
      f :success
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def trigger_state_event
    @feed = Feed.find(params[:id])

    if @feed.fire_state_event(params[:event])
      f(:success)
    else
      f(:error)
    end

    redirect_to action: :index
  end
end
