class Api::V1::Reports::ReportsController < Api::V1::ApiApplicationController
  skip_before_action :authenticate_request
  
  #POST /api/v1/reports/by_author.json
  def by_author
    if params[:start_date] && params[:end_date] && params[:email]
      ReportsMailer.by_author(params[:start_date], params[:end_date], params[:email]).deliver_later
      render json: "Report generation started.", status: :ok
    else
      render json: "Invalid parameters.", status: :unprocessable_entity
    end
  end
end
