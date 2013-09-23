class Web::PublicStandardsController < Web::ProtectedApplicationController
  def index
    @public_standards = Standard.public(current_client)
  end

  def show
    @public_standards = Standard.public(current_client).find(params[:id])
  end

  def copy
    public_standard = Standard.public(current_client).find(params[:id])
    copied = public_standard.dup
    copied.client = current_client
    copied.number = current_client.standards.roots.first.available_number
    copied.parent = current_client.standards.roots.first

    if copied.save
      redirect_to action: :index
    else
      redirect_to action: :index
    end

  end
end
