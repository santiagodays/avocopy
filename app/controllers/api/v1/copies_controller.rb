class Api::V1::CopiesController < ApplicationController
  def index
    @copies = Copy.all
  end

  def new
    @copy = Copy.new()
    render :template => "copies/new_file"
  end

  def create
    @copy = Copy.new(copy_params)
    if @copy.save
      FileCreatorWorker.perform_async(@copy.attachment.url)
      redirect_to copies_path, notice: "The copy #{@copy.name} has been created."
    else
      render :new
    end
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