# frozen_string_literal: true

class CVSerializer < ActiveModel::Serializer
  attributes :id, :file_url, :file_name, :created_at

  def file_url
    Rails.application.routes.url_helpers.rails_blob_url(object.file)
  end

  def file_name
    object.file.filename.to_s
  end

  def created_at
    object.created_at.strftime('%B %d, %Y - %H:%M')
  end
end
