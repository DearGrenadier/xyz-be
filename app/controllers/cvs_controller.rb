# frozen_string_literal: true

class CvsController < ApplicationController
  def index
    cvs =  CV.order(created_at: :desc).limit(params[:limit])
    render json: cvs, status: :ok
  end

  def create
    cv = CV.new
    cv.file.attach(io: cv_params[:file], filename: cv_params[:file].original_filename)

    if cv.save
      render json: cv, status: :created
    else
      render json: cv.errors.to_json, status: :unpocessable_untity
    end
  end

  def destroy
    if CV.delete(params[:id]).zero?
      head :unpocessable_untity
    else
      head :ok
    end
  end

  private

  def cv_params
    params.permit(:file)
  end
end
