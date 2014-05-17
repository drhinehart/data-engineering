class HomeController < ApplicationController
  def index
    if request.post?
      if !params[:file].blank?
        data_importer = DataImporter.new(params[:file].path)
        data_importer.import
        @gross_revenue = data_importer.gross_revenue
        flash[:notice] = "File submitted."
      else
        flash[:alert] = "A file is required. Please select a file."
      end
    end
  end
end
