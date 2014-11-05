class Vote < ActiveRecord::Base


	belongs_to :voter
	belongs_to :candidate
	belongs_to :seat

	validates :voter_id, presence: true, uniqueness: true
	validates :seat_id, uniqueness: true
	validates :candidate_id, presence: true

	def as_json(options)
		hash = {id: id,
			voter_id: voter_id,
			candidate_id: candidate_id,
			seat_id: seat_id,
		}


		{vote: hash}
	end

end
