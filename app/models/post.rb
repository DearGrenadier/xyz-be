# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: %i[unpublished published]
end
