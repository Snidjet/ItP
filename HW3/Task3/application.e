note
	description: "task3 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
	local game:GAME
			-- Run application.
		do
			create game.make
			game.play

		end

end
