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
      selected_member = @members.sample
      while selected_member == options[:immune]
        selected_member = @members.sample
      end
      puts "#{selected_member} was voted off"
      @members.delete(selected_member)
      return selected_member
    end
end
