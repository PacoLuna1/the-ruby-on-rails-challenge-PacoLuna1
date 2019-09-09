# frozen_string_literal: true

# Add details to users
class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
  end
end
