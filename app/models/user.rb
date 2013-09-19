class User < ActiveRecord::Base
  serialize :completed_challenges, Array

  def completed?(challenge)
    completed_challenges.include?(challenge)
  end

  def complete!(challenge)
    completed_challenges << challenge unless completed_challenges.include?(challenge)
    save!
  end
end
