# frozen_string_literal: true

class EnableExtensions < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'
  end
end
