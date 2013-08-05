class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_result(m1, m2)
  if m1[1] == m2[1]
    return m1
  end
  case m1[1]
  when 'R'
    if m2[1] == 'S'
      return m1
    elsif m2[1] == 'P'
      return m2
    end
  when 'S'
    if m2[1] == 'P'
      return m1
    elsif m2[1] == 'R'
      return m2
    end
  else
    if m2[1] == 'R'
      return m1
    elsif m2[1] == 'S'
      return m2
    end
  end
end

def rps_game_winner(game)
  posibility = [ "R", "P", "S"]
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless posibility.include? game[0][1] and posibility.include? game[1][1]
  return rps_result(game[0],game[1])
end

def rps_tournament_winner(tournament)
  if tournament[0][1].is_a?(String)
    return rps_game_winner(tournament)
  end
  i = 0
  tournament.each {
    |mini_tournament| tournament[i] = rps_tournament_winner(mini_tournament)
    i = i + 1
  }
  return rps_game_winner(tournament)
end
#R beats S; S beats P; and P beats R