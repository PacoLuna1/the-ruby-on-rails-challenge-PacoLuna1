# frozen_string_literal: true

json.extract! list, :id, :title, :created_at, :updated_at
json.url list_url(list, format: :json)
