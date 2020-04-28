# frozen_string_literal: true

class CV < ApplicationRecord
  has_one_attached :file

  validates :file, presence: true
end
