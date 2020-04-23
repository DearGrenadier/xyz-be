# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: %i[unpublished published]

  scope :published, -> { where(status: :published) }
end
