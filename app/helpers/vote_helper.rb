module VoteHelper

	def determine_vote(args)
		@voted = args[:voted]
		@post = args[:post]
		@type = args[:type]
		up_vote if @type == "up"
		down_vote if @type == "down"
	end

	def up_vote
		if @voted.voted_on_by? current_user
    	has_up_voted  
    else
      @voted.liked_by current_user
    end
	end

	def has_up_voted
		if current_user.voted_as_when_voted_for @voted
      @voted.unliked_by current_user
    else
      @voted.liked_by current_user
    end
	end

	def down_vote
		if @voted.voted_on_by? current_user
			has_down_voted      
    else
      @voted.disliked_by current_user
    end
	end

	def has_down_voted
		if current_user.voted_as_when_voted_for @voted
      @voted.disliked_by current_user
    else
      @voted.undisliked_by current_user
    end
	end

end