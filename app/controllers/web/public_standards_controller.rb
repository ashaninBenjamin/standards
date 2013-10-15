class Web::PublicStandardsController < Web::ProtectedApplicationController
  def index
    @public_standards = Standard.public(current_client)
  end

  def show
    @public_standard = Standard.public(current_client).find(params[:id])
  end

  def copy
    @public_standard = Standard.public(current_client).find(params[:id])
    #TODO make via gem amoeba
    copied = @public_standard.dup
    copied.client = current_client
    copied.number = current_client.standards.roots.first.available_number
    copied.parent = current_client.standards.roots.first

    if copied.save
      f :success
      redirect_to standard_path(id: copied.link)
    else
      f :error
      redirect_to public_standard_path(@public_standard)
    end

  end
end
