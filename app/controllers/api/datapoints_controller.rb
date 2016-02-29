module Api

  class DatapointsController < Api::BaseController
    protect_from_forgery with: :null_session

    def create
      @probe = Probe.find_by! serial_number: params.require(:serial)
      set_resource(@probe.probe_datapoints.create(data: JSON.parse(params.require(:data))))
      if get_resource.save
        render :show, status: :created
      else
        render json: get_resource.errors, status: :unprocessable_entity
      end
    end

    def datapoint_params
      params.require(:serial).require(:info)
    end

  end
end
