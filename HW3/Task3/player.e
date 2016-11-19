note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	make

feature
	--creation feature. Create player with name `new_name',`money' = 50 Rub and `position' = 1

	make (new_name: STRING)
		require
			valid_name: new_name /= Void
		do
			name := new_name
			money := 50
			position := 1
		ensure
			name = new_name
			money = 50
			position = 1
		end

feature --states of current player

	name: STRING

	money: INTEGER
			--amount of current player money

	position: INTEGER
			--Representation of position current player (1<=`position'<=40)

feature --Actions

	set_position (p: INTEGER)
			--Set player position on `p'
		require
			1 <= p and p <= 40
		do
			position := p
		ensure
			position = p
		end

	do_turn (die1, die2: INTEGER)
			--Player is doing his turn

		require
			1 <= die1 and die1 <= 6
			1 <= die2 and die2 <= 6

		do
			if die1 = die2 then
				io.put_string (name+" rolled double. Steped back on "+die1.out+" steps %N")
				set_position ((position - die1).max (1))
				io.put_string (name+" position now: "+ position.out + "%N")
				check_square
				io.put_string (name+" money now: "+money.out+"%N")
			elseif die1 + die2 + position <= 40 then
				io.put_string (name+" rolled: "+die1.out +" and "+die2.out+"%N" )
				set_position (position+die1+die2)
				io.put_string (name+" position now: "+ position.out + "%N")
				check_square
				io.put_string (name+" money now: "+money.out+"%N")
			else
				io.put_string ("Too large number. Player remains place. %N")
			end
		end

	check_square
		local
			investment_squares:ARRAY[INTEGER]
			lottery_squares:ARRAY[INTEGER]
		do
			investment_squares := <<6, 16, 26, 36>>
			lottery_squares := <<9, 19, 29, 39>>
			if investment_squares.has (position) then
				io.put_string (">>INVESTMENT SQUARE!<< %N Pay 50 Rub %N")
				change_money(-50)
			elseif
				lottery_squares.has (position)

			then
				change_money(100)
				io.put_string ("==LOTTERY SQUARE!== %N Take 100 Rub %N")
			end
		end

		change_money(amount:INTEGER)
			--There you can add or remove `amount' of `money', but money can't be less than zero
		do
			money:= (money + amount).max (0)
		ensure
			money = old money + amount or money = 0
		end

invariant
	non_empty_name: name /= void
	non_negative_money: money >= 0
	valid_position: 1 <= position and position <= 40

end
