# require 'openweathermap'
require 'date'
require 'net/http'
require 'json'
class Box
  def initialize 
    @struct=Array.new
    @struct.push(1,2,3,4,5,6,7,8,9)
  end
  def print_array
      puts "#{@struct[0]}|#{@struct[1]}|#{@struct[2]}\n#{@struct[3]}|#{@struct[4]}|#{@struct[5]}\n#{@struct[6]}|#{@struct[7]}|#{@struct[8]}\n"
  end
 
  
  def insert(position,position_value)
    if @struct[position]=="X" || @struct[position]=="O" 
      puts"Cannot enter on the same postion"
      return 1
    end  
      @struct[position]=position_value
      return 0
  end
  # def positioncheck(position)
  #   if @struct[position]=="X" && @struct[position]=="O" 
  #     return 1
  #   else
  #     return 0
  #   end 
  # end
def check
  if  @struct[0]==@struct[1]&&@struct[1]==@struct[2]
  return @struct[0]
  elsif @struct[3]==@struct[4]&&@struct[4]==@struct[5]
    return @struct[3]
  elsif @struct[6]==@struct[7]&&@struct[7]==@struct[8]
    return @struct[6]
  elsif @struct[0]==@struct[3]&&@struct[3]==@struct[6]
    return @struct[0]
  elsif  @struct[1]==@struct[4]&&@struct[4]==@struct[7]
    return @struct[1]
  elsif @struct[2]==@struct[5]&&@struct[5]==@struct[8]
    return @struct[2]
  elsif @struct[0]==@struct[4]&&@struct[4]==@struct[8]
    return @struct[0]
  elsif @struct[2]==@struct[4]&&@struct[4]==@struct[6]
    return @struct[2]
  else
    return 1
  end
end

end

class Stone #this is stone class 
  # def initialize
  # end
  def weaponx(pass)
    case pass
    when 1
      puts"I choose paper I WIN !!!!!!"
    when 2
      puts"I choose Scissor I WIN !!!!!!"
    when 3
      puts"I choose stone I WIN !!!!!!"
    
    end  
  end
  def weapon(pass)
    random=rand(3)
    if(pass==1 && random==0)
      puts"I choose Stone \nIts a Draw !!"
    elsif(pass==1 && random==1)
      puts"I choose paper \nHAHA You lose :)"
    elsif(pass==1 && random==2)
      puts"I choose Scissor \nDamn...You Win !!!"
    elsif(pass==2 && random==0)
      puts"I choose Stone \nOppsie You WiN !!!"
    elsif(pass==2 && random==1)
      puts"I choose paper \n\nWOW you had me Its a DraW:>"
    elsif(pass==2 && random==2)
      puts"I choose Scissor \n\nGotachaaaa !!! I won"
      print_array
    elsif(pass==3 && random==0)
      puts"I choose Stone \n\nYoo!!! I Won !!!XO"
    elsif(pass==3 && random==1)
      puts"I choose paper \n\nWell played senior You Win :)"
    elsif(pass==3 && random==2)
      puts"I choose Scissor \n\nAdios partner we met again Its a draw" 
    end
  end
end

class Guess
  def level(level)
    case level
    when "easy"
      puts"Enter number between 0-5"
      @random=rand(6)
    when "medium"
      puts"Enter number between 0-20"
      @random=rand(21)
    when "hard"
      puts"Enter number between 0-50"
      @random=rand(51)
    end
  end
  def number(num,level)
    if num==@random 
      puts "You guess the Actual Number "
    elsif num==@random
      puts "You guess the Number !!!!"
    elsif num==@random
      puts "You guess the Number !!!!"
    else 
      puts"Your guess is wrong Actual number is #{@random}"
    end
    level(level)
  end
end

class Question #third game
  attr_accessor :ques,:ans
  def initialize(ques,ans)
    @ques=ques
    @ans=ans
  end
end

loop do
puts "\n\nWhat game would you like to play \n\n1.Stone,Paper and Scissors\n2.Number gussing\n3.Quize\n4.Tic Tack toe\n5.Weather\n6.Exit\n\n(Enter number)"

# choose=0
choose=gets.chomp.downcase
if choose=="exit"
  # break
  puts "exit"
  n= " "
  100.times do |i| 
    puts "#{n}Exit"
    n+= " "
  end
  system('curl ascii.live/parrot')
else
  choose=choose.to_i
  if choose==6
    # break
    100.times do |i|
      puts"Exit"
    end
    system('curl ascii.live/parrot')
  end
end

case choose   #choosing game
when 1
  s=Stone.new
  puts "Choose level: Possible Impossible\n(Write your level)"
  level=gets.chomp.downcase
    case level
    when "possible"
      loop do
        puts"Choose your weapon(Stone,Paper or Scissor)"
        weapon=gets.chomp.downcase
        if weapon=="exit"
          break
        end
        case weapon
        when "stone"
          s.weapon(1)
        when "paper"
          s.weapon(2)
        when "scissor"
          s.weapon(3)
        else
          puts "Enter an valid option"
        end
      end    
    when "impossible"
      loop do  
        puts"Choose your weapon(Stone,Paper or Scissor)"
        weapon=gets.chomp.downcase
        if weapon=="exit"
          break
        end
        case weapon
        when "stone"
          s.weaponx(1)
        when "paper"
          s.weaponx(2)
        when "scissor"
          s.weaponx(3)
        else
          puts "Enter an valid option"
        end   
      end   
    else
      puts "Enter valid option"
    end
when 2
  loop do  
    g=Guess.new
    puts"choose your level(Easy Medium Hard)"
    level=gets.chomp.downcase
    if level=="exit"
      break
    end
    g.level(level)
    loop do
      number=gets.chomp.downcase
      if number=="exit"
        break
      else
        number=number.to_i 
        g.number(number,level)
      end
    end
  end
when 3 
  def run(questions)
    score=0
    ans= ""
    for question in questions
      puts question.ques
      ans=gets.chomp
      if ans==question.ans
        score+=1
      end
    end
      puts "Your score is #{score}/#{questions.length}"
  end
  q1 = "Ruby was created by \n(a).Yukihiro “Matz” Matsumoto \n(b).Dennis Ritchie\n(c).Bjarne Stroustrup"
  q2 = "Ruby was Release in which year\n(a)1989\n(b)1966\n(c)1995"
  q3 = "When ruby on rails was relased \n(a)Jan 2024\n(b)July 2004\n(c)feb 2000"
  questions = [Question.new(q1,"a"),Question.new(q2,"c"),Question.new(q3,"b"),]
  run(questions)
when 4

  loop do
    a=Box.new
    puts "Chose your weapon User 1(X,O)"
    user1=gets.chomp.upcase
    if user1=="EXIT"
      break
    elsif user1!="X"&&user1!="O"
      puts "Enter either X or O"
      next
    end
    puts "Chose your weapon User 2 \t[#{user1} is alaready taken]"
    user2=gets.chomp.upcase
    if user2=="EXIT"
      break
    elsif user2!="X"&&user2!="O"
      puts "Enter either X or O"
      next
    end
    if user1==user2
      puts "Both are same Enter again"
      next
    end
    
    a.print_array
    i=0
      loop do
        i+=1
        if i>9
          puts "No one won"
          break
        end
        puts "chose potision user one"
        position=gets.chomp.upcase
        if position=="EXIT"
          break
        end
        position=position.to_i-1
        # double_position=0
        # double_position=a.positioncheck(position)
        # if double_position==1  
        #   puts "this one is already occupied"
        #   next 
        # end
        incheck=0
        incheck=a.insert(position,user1)
        if incheck==1
          i-=1
          break
        end
        i+=1
        
        a.print_array
        if i>9
          puts "No one won"
          break
        end
        n=1
        n=a.check
        if(n!=1)
          if n==user1
            puts "User 1 won"
            break
          else 
            puts "User 2 won"
            break
          end
        end
        puts "chose potision user two"
        position=gets.to_i-1
        incheck=0
        incheck=a.insert(position,user2)
        if incheck==1
          i-=1
          break
        end
        a.print_array
        n=1
        n=a.check
        if(n!=1)
          if n==user1
            puts "User 1 won"
            break
          else 
            puts "User 2 won"
            break
          end
        end
      end
    end
when 5
  puts "Enter city Name"
  city_name=gets.chomp.downcase
  city = "https://api.openweathermap.org/geo/1.0/direct?q=#{city_name}&appid=f4b1373d86683eb2b219566ac8b10569"
  city_uri = URI(city)
  city_response = Net::HTTP.get(city_uri)
  lat=JSON.parse(city_response)[0]["lat"]
  lon=JSON.parse(city_response)[0]["lon"]
  preuri= "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units=metric&date=2024-10-11&appid=f4b1373d86683eb2b219566ac8b10569"
  uri = URI(preuri)
  response = Net::HTTP.get(uri)
  weat=JSON.parse(response)["weather"][0]["main"]
  tem=JSON.parse(response)["main"]["temp"]
  # nash=vash[0]
  # puts nash["main"]
  cur_date=Date.today
  puts "Weather :#{weat} \ntempature : #{tem} \nDate:#{cur_date}"
else 
  puts "Please enter a valid option"
end

end