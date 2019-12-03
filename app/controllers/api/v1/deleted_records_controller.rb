class Api::V1::DeletedRecordsController < Api::BaseController

  def index
    since     = params[:since]

    @deleted_records = DeletedRecord.order_by(created_at: :desc)
    @deleted_records = @deleted_records.where(:created_at.gt => Time.parse(since)) if since.present?

    respond_with @deleted_records
  end
end
