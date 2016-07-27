class Game
  attr_accessor :tribes, :name, :members, :tribe

  def initialize(name, members)
    @name = name
    @members = members
    @tribes = []
    @tribe = tribe
  end

  def add_tribe(tribe)
    @tribes << @tribe
  end
end
