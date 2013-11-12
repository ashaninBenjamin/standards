class Pdf::StandardsController < Pdf::ApplicationController
  def index
    @standards = Standard.sort_standards_by_code current_client.standards.stem.decorate
  end

  def show
    @standard = current_client.standards.get_by_link(params[:id]).decorate
    @children = Standard.sort_standards_by_code @standard.children
  end
end
