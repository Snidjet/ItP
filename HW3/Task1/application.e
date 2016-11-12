	note
	description: "AS1T1 application root class"
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
			-- Run application.
		local
			hero: HERO
			warrior: WARRIOR
			healer: HEALER
			l: LINKED_LIST [HERO]
		do
			
		create {WARRIOR} hero.make ("Thor")
		warrior:=hero
		warrior.attack (hero)
		end

end
