module Api

  class ProbesController < Api::BaseController
    skip_before_filter :verify_authenticity_token

    def create
      @probe = Probe.find_by! serial_number: params.require(:serial)
      @probe.user_id = current_user.id
      @probe.save()
      render :show, status: :created
    end

    def datapoint_params
      params.require(:serial).require(:info)
    end

  end
end
