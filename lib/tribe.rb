class Tribe
  attr_accessor :name, :members

  def initialize(tribe)
    @name = tribe[:name]
    @members = tribe[:members]
    puts "Tribe #{@name} was created"
  end

  def name
    puts "#{@name}"
  end

    def tribal_council(options={})
      chosen_member = @members.sample
      while chosen_member == options[:immune]
        chosen_member = @members.sample
      end
      puts "#{chosen_member} was voted off"
      @members.delete(chosen_member)
      return chosen_member
    end
end
