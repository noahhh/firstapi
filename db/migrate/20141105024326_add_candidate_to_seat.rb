class AddCandidateToSeat < ActiveRecord::Migration
  def change
    add_reference :seats, :candidate, index: true
  end
end
