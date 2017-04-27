module Countable
  def vote_count
    self.votes.where(up_down: "up").count - self.votes.where(up_down: "down").count
  end
end
