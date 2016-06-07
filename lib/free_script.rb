#!/usr/bin/env ruby
puts 'Test'

class Members
  attr_accessor :member_name
  attr_reader :member_id
  attr_accessor :member_city
  attr_accessor :sexual_ref

  def initialize(member, id, *city, sexual_ref)
    @member_name = member
    @member_id = id
    @member_city = city
    @sexual_ref = sexual_ref
  end
end

module HelpersModule
  def date_string
    return "The date between #{@member1.member_name} and #{@member2.member_name} will take place in #{@location}" unless !is_same_sexual_ref
  end
end

module RomanticDate
  class Date < Members
    include HelpersModule
    attr_reader :memebrName
    attr_accessor :member1
    attr_accessor :member2

    def initialize(first_member_name, first_member_city, second_member_name, second_member_city, first_member_sexual_ref, second_member_sexual_ref)
      @member1 = Members.new(first_member_name, 1, first_member_city, first_member_sexual_ref)
      @member2 = Members.new(second_member_name, 2, second_member_city, second_member_sexual_ref)
      @location = 'Berlin' # default
    end

    def change_meeting_location(new_location)
      @location = new_location
    end

    def is_same_sexual_ref
      #puts " " + @member1.sexual_ref.to_s + " " + @member2.sexual_ref.to_s
      case @member1.sexual_ref == 'straight_male' && @member2.sexual_ref == 'straight_female'
        when true
          return true
      end
      case @member1.sexual_ref == 'straight_female' && @member2.sexual_ref == 'straight_male'
        when true
          return true
      end
      case @member1.sexual_ref == 'gay_male' && @member2.sexual_ref == 'gay_male'
        when true
          return true
      end
      case @member1.sexual_ref == 'gay_female' && @member2.sexual_ref == 'gay_female'
        when true
          return true
      end
        false
    end
  end
end

# Excutable area
new_romantic = RomanticDate::Date.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3], ARGV[4], ARGV[5])
puts new_romantic.date_string
