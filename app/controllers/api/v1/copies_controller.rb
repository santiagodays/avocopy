class Api::V1::CopiesController > ApiController
  def index
    @copies = Copy.all
  end

  def new
    @copy = Copy.new
  end

  def create
    FileCreator.call(params[:file_path])
  end

  def destroy
    @copy = Copy.find(params[:id])
    @copy.destroy
    redirect_to copies_path, notice:  "The copy #{@copy.name} has been deleted."
  end
  private

  def copy_params
    params.require(:copy).permit(:name, :attachment)
  end

end