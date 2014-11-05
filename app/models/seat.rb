class Seat < ActiveRecord::Base

	has_many :votes
	has_many :candidates

	validates :name, presence: true

	def as_json(options)
		hash = {
			Seat_name: name,
			id: id,
			Candidate_id: candidate_id,
			Vote_id: vote_id
			}


			{Seat: hash}
	end
end
