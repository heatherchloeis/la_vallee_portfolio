class Example < ApplicationRecord
	validates :category, presence: true, format: { with: /(image|video)/ }

	has_one_attached :content

	default_scope -> { order(created_at: :desc) }
end