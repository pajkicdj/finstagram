

###################



 def humanized_time_ago(time_ago_in_minutes)   
    if time_ago_in_minutes >= 60
        "#{time_ago_in_minutes/60}h"
    else
        "#{time_ago_in_minutes}m"
    end
end

# the '/' is the home page!!!
#these get methods will be used for EVERY page :)
get '/' do #doesn't like curly brackets ugh and the '/' is the request path aka the directory 
    @post_sharky_j = {
        username: "sharky_j",
        avatar_url: "http://naserca.com/images/sharky_j.jpg",
        photo_url: "http://naserca.com/images/shark.png",
        humanized_time_ago: humanized_time_ago(15),
        like_count: 0,
        comments: [{
            username: "sharky_j",
            text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
            },
            {username: "creepy_p",
            text: "lammmmmme!"
            },
            {username: "leo_p",
            text: "I might be in love with someone who commented above me @u@"
            }
        ] # arrays can hold hashes too!!!! weird eh?
    }
    
    @post_creepy_p = {
        username: "creepy_p",
        avatar_url: "http://media.zenfs.com/en-US/video/video.discoverychannel2.com/GoblinShark_576x374_2399773703.jpg",
        photo_url: "http://resources0.news.com.au/images/2014/05/05/1226905/898804-98350eee-d3f4-11e3-95ae-9151c7cd2575.jpg",
        humanized_time_ago: humanized_time_ago(10),
        like_count: 100,
        comments: [{
            username: "creepy_p",
            text: "Unlike some sharks *cough*sharky_j*cough* I like to go all natural #no filter!"
        }] # arrays can hold hashes too!!!! weird eh?
    }
        
    @post_leo_p = {
        username: "leo_p",
        avatar_url: "http://www.leisurepro.com/blog/wp-content/uploads/2011/07/leopard-shark.jpg",
        photo_url: "http://www.montereybayaquarium.org/-/m/images/animal-guide/fishes/leopard-shark.jpg?bc=white&h=675&mh=738&mw=1312&w=1196&usecustomfunctions=1&cropx=3&cropy=176",
        humanized_time_ago: humanized_time_ago(25),
        like_count: 0,
        comments: [{
            username: "leo_p",
            text: "lunchtime! ;)"
        }]
    }
    @posts = [@post_sharky_j, @post_creepy_p, @post_leo_p]   #.to_s casts this to a string in order to view it in the browser!!!
    erb :index
end

#create a new page!!
#look at this page when given a request for the about page

get '/about' do
  @company_name = "Lighthouse Labs"
  @employees = [
    {name: "Alex", years: 5},
    {name: "Leigh", years: 1},
    {name: "Maggie", years: 10}
  ]
  erb :about  #it will look for a file called about.erb in the app views folder #doesn't have to be first?
end

get '/contact' do
  "Contact us"
end









#FIZZ BUZZZZZZZZZZZZ
#####################
get '/' do
    ii = ""
    for num in 1...101
      if ((num%3 == 0) && (num%5 == 0
          ii += num.to_s + ": FizzBuzz"
      elsif ((num%5 == 0) && (num%3 != 0))
          ii += num.to_s + ": Buzz "
      elsif ((num%3 == 0) && (num%5 != 0))
          ii += num.to_s + ": Fizz "
      else
          ii += num.to_s + ":/ "
      end
    end
    [ii].to_s
end


#####################
### YELLOW PAGER



get '/' do
    ii = ""
    word = "HelloNYCNY"
    word.downcase!
    x = word.split("")
    x.each do |i|
        if i == "a" || i == "b" || i == "c"
            ii += "2"
        elsif i =="d" || i == "e" || i == "f"
            ii += "3"
        elsif i =="g" || i == "h" || i == "i"
            ii += "4"
        elsif i =="j" || i == "k" || i == "l"
            ii += "5"
        elsif i =="m" || i == "n" || i == "o"
            ii += "6"
        elsif i =="p" || i == "q" || i == "r" || i == "s"
            ii += "7"
        elsif i =="t" || i == "u" || i == "v"
            ii += "8"
        elsif i =="w" || i == "x" || i == "y" || i == "z"
            ii += "9"
        else
            ii += ""
        end
    end
    [ii].to_s
    
end



##################
#THIS WAS IN THE actions.rb PAGE BEFORE WE DELETED IT aka its between the get '/' do  erb(:index) end

@post_sharky_j = {
        username: "sharky_j",
        avatar_url: "http://naserca.com/images/sharky_j.jpg",
        photo_url: "http://naserca.com/images/shark.png",
        humanized_time_ago: humanized_time_ago(15),
        like_count: 0,
        comments: [{
            username: "sharky_j",
            text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
            },
            {username: "creepy_p",
            text: "lammmmmme!"
            },
            {username: "leo_p",
            text: "I might be in love with someone who commented above me @u@"
            }
        ] # arrays can hold hashes too!!!! weird eh?
    }
    
    @post_creepy_p = {
        username: "creepy_p",
        avatar_url: "http://media.zenfs.com/en-US/video/video.discoverychannel2.com/GoblinShark_576x374_2399773703.jpg",
        photo_url: "http://resources0.news.com.au/images/2014/05/05/1226905/898804-98350eee-d3f4-11e3-95ae-9151c7cd2575.jpg",
        humanized_time_ago: humanized_time_ago(10),
        like_count: 100,
        comments: [{
            username: "creepy_p",
            text: "Unlike some sharks *cough*sharky_j*cough* I like to go all natural #no filter!"
        }] # arrays can hold hashes too!!!! weird eh?
    }
        
    @post_leo_p = {
        username: "leo_p",
        avatar_url: "http://www.leisurepro.com/blog/wp-content/uploads/2011/07/leopard-shark.jpg",
        photo_url: "http://www.montereybayaquarium.org/-/m/images/animal-guide/fishes/leopard-shark.jpg?bc=white&h=675&mh=738&mw=1312&w=1196&usecustomfunctions=1&cropx=3&cropy=176",
        humanized_time_ago: humanized_time_ago(25),
        like_count: 0,
        comments: [{
            username: "leo_p",
            text: "lunchtime! ;)"
        }]
    }
    @posts = [@post_sharky_j, @post_creepy_p, @post_leo_p]   #.to_s casts this to a string in order to view it in the browser!!!
    
######################################