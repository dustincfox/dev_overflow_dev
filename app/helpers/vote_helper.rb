module VoteHelper

	def determine(args)
		@voted = args[:voted]
		@post = args[:post]
	end

end