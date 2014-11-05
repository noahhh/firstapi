class AddSeatToVote < ActiveRecord::Migration
  def change
    add_reference :votes, :seat, index: true
  end
end
