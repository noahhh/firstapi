class AddVoteToSeat < ActiveRecord::Migration
  def change
    add_reference :seats, :vote, index: true
  end
end
