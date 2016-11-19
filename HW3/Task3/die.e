note
	description: "Summary description for {DIE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DIE


feature



	roll: INTEGER
		local
			random: V_RANDOM
		do
			from
				create random
			until
				(Result >= 1) and (Result <= 6)
			loop
			
						from
						until
							Result = 50
						loop
							Result := random.bounded_item (1, 100)
							random.forth
						end

				Result := random.bounded_item (1, 100)
				random.forth
			end
		ensure
			Result >= 1
			Result <= 6
		end

end
