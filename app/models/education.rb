class Education < ApplicationRecord
	validates :school, presence: true
	validates :year, presence: true
	validates :degree, presence: true
	validates :major, presence: true

	default_scope -> { order(created_at: :desc) }
end