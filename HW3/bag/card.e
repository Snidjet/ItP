note
	description: "Summary description for {CARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CARD
inherit COMPARABLE

create
	make

feature

	make (n: INTEGER; c: CHARACTER)
			--creation feature for card
		require
			valid_number: n >= 1 and n <= 20
			valid_color: c = 'R' or c = 'W' or c = 'G' or c = 'B'
		do
			number := n
			colour := c
		ensure
			number = n
			colour = c
		end

feature
	--Attributes

	number: INTEGER
			--number of the card

	colour: CHARACTER
			--Colour of the card.

feature  --Queries

	is_less alias "<"(other:like CURRENT): BOOLEAN
			--is this card less than  `other'
			--card 'B' less than 'G', 'G' less than 'R', 'R' less than 'W'
		do
			if current.colour /= other.colour then
				if current.colour < other.colour then
					Result := TRUE
				else
					Result := FALSE
				end
			elseif current.number < other.number then
				Result := TRUE
			else
				Result := FALSE
			end
		end



invariant
	number >= 1 and number <= 20
	colour = 'R' or colour = 'W' or colour = 'G' or colour = 'B'

end
