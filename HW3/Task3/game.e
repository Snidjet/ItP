note
	description: "Summary description for {GAME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME

create
	make

feature
	--Creation feature

	make
		local
			n: INTEGER --Number of players

		do
			io.put_string ("Welcome to the game!%N")
			io.put_string ("Enter number of players from 2 to 6: ")
			io.read_integer
			n := io.last_integer
			if not (2 <= n and n <= 6) then
				from
				until
					2 <= n and n <= 6
				loop
					io.put_string ("Invalid number try again: ")
					io.read_integer
					n := io.last_integer
				end
			end
			create_players (n)
		end

	play
			--Main feature. It starts the game.
		local
			current_player: PLAYER
			die: DIE
			i: INTEGER
			die1, die2: INTEGER
		do
			create die
			i := 1
			from
				current_player := players.at (i)
			until
				check_winner = TRUE
			loop
				io.put_string ("%N%N NEXT TURN:%N ============================ %N")
				io.put_string (current_player.name + "  <<>> position: " + current_player.position.out + "  <<>> money: " + current_player.money.out + "%N")
				die1 := die.roll
				die2 := die.roll
				current_player.do_turn (die1, die2)
				if current_player = players.at (players.count) then
					i := 1
					current_player := players.at (i)
				else
					i := i + 1
					current_player := players.at (i)
				end
			end
			calculate_winners
		end

feature {NONE}
	--Working features

	create_players (n: INTEGER)
			--create Array of players
		local
			i: INTEGER
			player: PLAYER
		do
			create players.make (1, n)
			from
				i := 1
			until
				i > n
			loop
				create player.make ("Player" + i.out)
				players.force (player, i)
				io.put_string ("player" + i.out + "%N")
				i := i + 1
			end
		end

	players: ARRAY [PLAYER]
			--Representation of players in the game

	check_winner: BOOLEAN
			--Is it end of the game?

		do
			across
				players as p
			loop
				if p.item.position = 40 then
					Result := TRUE
				end
			end
		end

	calculate_winners
			--Who is the winner?
		local
			max: INTEGER --max summ of money
			winners: ARRAY [PLAYER]
		do
			max := 0
			create winners.make_empty
			io.put_string ("%N%N =========The end of the game!=========%N")
			across
				players as p
			loop
				if p.item.money > max then
					max := p.item.money
				end
			end
			io.put_string ("%N%N==========WINNERS==========%N")
			across
				players as p
			loop
				if p.item.money = max then
					io.put_string ("====== " + p.item.name + "%N")
				end
			end
		end

invariant
	players_valid: players /= void

end
