class Example < ApplicationRecord
	validates :title, presence: true
	validates :category, presence: true, format: { with: /(image|video)/ }
	
	default_scope -> { order(created_at: :desc) }

	has_one_attached :content
end