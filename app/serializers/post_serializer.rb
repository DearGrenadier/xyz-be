# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :title, :status, :updated_at

  def updated_at
    object.updated_at.strftime('%B %d, %Y')
  end
end
