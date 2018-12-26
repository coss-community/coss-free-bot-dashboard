# frozen_string_literal: true

class Stat < ApplicationRecord
  def self.instance
    first_or_create
  end
end
