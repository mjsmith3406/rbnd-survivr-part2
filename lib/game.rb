class Game
  attr_accessor :tribes

  def initialize(*tribes)
    @tribes = tribes
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes.clear
  end

  def merge(tribe)
    members = @tribes[0].members + @tribes[1].members
    clear_tribes
    add_tribe(Tribe.new({name: tribe, members: members}))
    return @tribes.first
  end

  def individual_immunity_challenge
    @tribes.sample.members.sample
  end
end
