class
	TEST

create
	testing_impl

feature -- Testing the implementation

	testing_impl
			-- it initialises this class which is devoted for testing
		local

			cards: LINKED_BAG [CARD]
			card,card1:CARD

			i:INTEGER
		do
			create cards
			across
				<<'G','W','R','B'>> as k
			--there is I take a little different order for "disordered" mix
			loop
				across
					1 |..| 4 as j
					--the same disordered sequence
				loop
					create card.make (j.item, k.item)
					cards.add (card, 1)

				end
			end
			io.put_string ("%N%T%T========================%N%T%T  UNSORTED LINKED_BAG %N%T%T========================%N")
			io.put_string (cards.str)
			io.put_string ("%N%T%T=======================%N%T%T  SORTED LINKED LIST%N%T%T=======================%N")
			io.put_string (linked_list_out (cards.sorted_linker_list))


		end


linked_list_out (ll: LINKED_LIST [CARD]): STRING
			-- similar to `{LINKED_BAG}.str'
		do
			create Result.make_empty
			Result.append ("%N")
			across
				ll as it
			loop

				Result.append (it.item.out)

			end
			Result.append ("%N")
		end
end
