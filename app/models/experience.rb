class Experience < ApplicationRecord
	validates :company, presence: true
	validates :location, presence: true
	validates :title, presence: true
	validates :year, presence: true
	validates :desc, presence: true

	default_scope -> { order(created_at: :desc) }
end