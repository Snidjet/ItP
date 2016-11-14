class
	TEST

create
	testing_impl

feature -- Testing the implementation

	testing_impl
			-- it initialises this class which is devoted for testing
		local
			c,c_other:LINKED_BAG[INTEGER]
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
					1 |..| 10 as j
					--the same disordered sequence
				loop
					create card.make (j.item, k.item)
					cards.add (card, 1)
				end
			end
		io.put_string (cards.max.number.out + " " + cards.max.colour.out+"%N")
		io.put_string (cards.min.number.out + " " + cards.min.colour.out)
		io.put_string (cards.link_on_prev_v (card).value.number.out)
		end

end
