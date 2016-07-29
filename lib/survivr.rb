require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require 'colorizr'

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
 @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
 @contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
 # Create two new tribes with names
 @coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
 @hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
 @borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  8.times do
    tribe_without_immunity = @borneo.immunity_challenge
    puts "Tribe #{tribe_without_immunity.to_s.yellow} will be voting tonight."
     voted_off_contestant = tribe_without_immunity.tribal_council
     puts "#{voted_off_contestant.to_s.red} was removed."
  end
end

def phase_two
  3.times do
    immune = nil
    voted_off_contestant = nil

    immune = @borneo.individual_immunity_challenge
    puts "#{immune.to_s.green} has won the individual immunity challenge and now is safe from elimination."
    voted_off_contestant = @merge_tribe.tribal_council({immune: immune})
    puts "#{voted_off_contestant.to_s.capitalize} was voted off."
  end
end

def phase_three
  7.times do |immunity|
    immune = @borneo.individual_immunity_challenge
    voted_off_contestant = @merge_tribe.tribal_council({immune: immune})

    puts "#{voted_off_contestant.to_s.red} was voted off and is member #{immunity + 1} of the jury."
    @jury.add_member voted_off_contestant

    print "Remaining tribe members on #{"Cello".blue} are: "
    members_left @merge_tribe
  end
end

def members_left(tribe)
  tribe.members.each_with_index do |member, immune|
    print member.name + ', ' if immune < tribe.members.length - 1
    puts member.name if immune == tribe.members.length - 1
  end
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
 phase_one #8 eliminations
 @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
 phase_two #3 more eliminations
 @jury = Jury.new
 phase_three #7 elminiations become jury members
 finalists = @merge_tribe.members #set finalists
 vote_results = @jury.cast_votes(finalists) #Jury members report votes
 @jury.report_votes(vote_results) #Jury announces their votes
 @jury.announce_winner(vote_results) #Jury announces final winner
