class JobsController < ApplicationController
  before_action :authenticate_user!

  def create_from_chrome
    company = Company.find_or_create_by(name: params[:company_name], user_id: current_user.id)
    @job = Job.create(title: params[:title], company_id: company.id)

    respond_to do |f|
      if @job.save
        f.json { render json: 201 }
      else
        f.json { render status: :unprocessable_entity}
      end
    end
  end


end
