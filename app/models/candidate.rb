class Candidate < ActiveRecord::Base
	has_many :votes

	validates :name, presence: true
	validates :party, presence: true

	def as_json(options)
		hash = {id: id,
			name: name,
			party: party,
			vote_count: votes.count}


			{candidate: hash}
	end
end
