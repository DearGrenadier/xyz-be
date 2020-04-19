# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :title, :status, :created_at

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
