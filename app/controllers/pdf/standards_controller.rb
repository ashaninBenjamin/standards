class Pdf::StandardsController < Pdf::ApplicationController
  def index
    ids = params[:ids].split(',') if params[:ids]
    @standards = Standard.sort_standards_by_code current_client.standards.stem.several(ids).decorate
  end

  def show
    @standard = current_client.standards.get_by_link(params[:id]).decorate
  end
end
