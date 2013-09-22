class Web::StandardsController < Web::ProtectedApplicationController
  def index
    @q = current_client.standards.stem.ransack(params[:q])
    @standards = Standard.sort_standards_by_code @q.result(distinct: true).decorate
  end

  def new
    @standard = StandardNewType.new
    @available_numbers = @standard.available_numbers(current_client)
    @available_parents = Standard.sort_standards_by_code @standard.available_parents(current_client).decorate
  end

  def create
    @standard = StandardNewType.new(params[:standard])
    @standard.client = current_client
    @available_numbers = @standard.available_numbers(current_client)
    @available_parents = Standard.sort_standards_by_code @standard.available_parents(current_client).decorate
    if @standard.save
      redirect_to standard_path(@standard.link)
      f :success
    else
      render action: :new
    end
  end

  def edit
    @standard = current_client.standards.get_by_link(params[:id])
    @standard = @standard.becomes(StandardEditType)
    @available_numbers = @standard.available_numbers
    @available_parents = Standard.sort_standards_by_code @standard.available_parents(current_client).decorate
  end

  def update
    @standard = current_client.standards.get_by_link(params[:id])
    @standard = @standard.becomes(StandardEditType)
    @available_numbers = @standard.available_numbers
    @available_parents = Standard.sort_standards_by_code @standard.available_parents(current_client).decorate
    if @standard.update_attributes(params[:standard])
      redirect_to standard_path(@standard.link)
      f :success
    else
      render action: :edit
    end
  end

  def show
    @standard = current_client.standards.get_by_link(params[:id]).decorate
    @children = Standard.sort_standards_by_code @standard.children
  end
end
