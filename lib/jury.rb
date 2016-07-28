class Jury
 attr_accessor :members

  def initialize
    @members = []
    @finalists = Hash.new

  end
  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
     finalists.each do |finalist|
       @finalists[finalist] = 0
     end

    @members.each do |member|
      puts "#{member.name} has voted for #{finalists.sample}"
      @finalists[finalists.sample] += 1
    end
    return @finalists
  end

  def report_votes(end_votes)
    end_votes.each do |finalist, score|
      puts "#{finalist} score is #{score}"
    end
  end

  def announce_winner(end_votes)
    end_votes.max_by { |_, vote| vote }.first

  end
end
