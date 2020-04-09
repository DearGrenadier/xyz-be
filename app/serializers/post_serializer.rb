# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :title
end
