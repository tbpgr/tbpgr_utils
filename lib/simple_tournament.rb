# encoding: utf-8

# SimpleTournament
class SimpleTournament
  attr_reader :tournament, :number, :messages

  # initialize tournament by number
  def initialize(number)
    @number = number
    @messages = []
    cnt = 0
    @tournament = []
    while number >= (2**cnt)
      tournament << Array.new(2**cnt)
      cnt += 1
    end
    diff = number - (2**(cnt - 1))
    @tournament << Array.new(diff * 2) unless (diff == 0)
  end

  # apply challengers to tournament
  def apply_challengers(challengers)
    fail 'incorrect challengers size. challengers must equals tournament.size' unless challengers.size == @number
    @tournament.reverse_each do |outer|
      outer.each_with_index do |v, i|
        poped = challengers.pop
        return @tournament if poped.nil?
        outer[i] = poped
      end
    end
  end

  # start tournament match. set result to tournament, messages
  def start_match(proc)
    @tournament.reverse_each.with_index do |outer, outer_index|
      outer.reverse_each.with_index do |inner, inner_index|
        next if inner_index.odd?
        next if inner_index == outer.size - 1
        rets = proc.call outer[-(inner_index + 1)], outer[-(inner_index + 2)]
        winner = rets.first
        @messages << rets.last
        set_winner(winner, outer_index)
      end
    end
  end

  private

    def set_winner(winner, outer_index)
      @tournament[0..-(outer_index + 1)].reverse_each do |replace_outer|
        replace_outer.reverse_each.with_index do |reverse_inner, reverse_inner_index|
          next unless reverse_inner.nil?
          return replace_outer[-(reverse_inner_index + 1)] = winner
        end
      end
    end
end
