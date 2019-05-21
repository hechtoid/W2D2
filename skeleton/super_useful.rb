# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError
  return 5
end

# PHASE 3
FRUITS = ["apple", "banana", "orange", "garbage"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  maybe_fruit = gets.chomp
   
    reaction(maybe_fruit) 
  rescue
    if wants_coffee
      retry
    else
      puts "Not Coffee!" 
      puts "We are done here!!"
      exit
    end
    
    end
end  

def wants_coffee
  puts "That's not a fruit!"
  puts "Now I want COFFEE!"
  maybe_coffee = gets.chomp
  maybe_coffee == "coffee" ? true : false
end



# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    raise NoNewFriendsError if @yrs_known <= 5
    if @name.length <= 0 || @fav_pastime.length <=0
        raise InputRequiredError
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known} years."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


