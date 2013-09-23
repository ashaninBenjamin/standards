class Web::PublicStandardsController < Web::ProtectedApplicationController
  def index
    @public_standards = Standard.public
  end

  def show
    @public_standards = Standard.public.find(params[:id])
  end
end
