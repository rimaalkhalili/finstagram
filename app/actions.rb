def humanized_time_ago (times_go_in_minutes)

    if times_go_in_minutes>= 60
        "#{times_go_in_minutes/60} hours ago"
    else
        "#{times_go_in_minutes} minutes ago"
    end
end

get '/' do 
        
    finstagram_post_shark = {
    username: "sharky_j",
    avatar_url: "http://naserca.com/images/sharky_j.jpg",
    photo_url: "http://naserca.com/images/shark.jpg",
        humanized_time_ago: humanized_time_ago(15) ,
        like_count: 0,
        comment_count: 1,
        comments: [{
                username: "sharky_j",
                text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
        }]
    }

    finstagram_post_whale = {
    username: "kirk_whalum",
    avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
    photo_url: "http://naserca.com/images/whale.jpg",
    humanized_time_ago: humanized_time_ago(65),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "kirk_whalum",
      text: "#weekendvibes"
    }]
  }

  finstagram_post_marlin = {
    username: "marlin_peppa",
    avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
    photo_url: "http://naserca.com/images/marlin.jpg",
    humanized_time_ago: humanized_time_ago(190),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "marlin_peppa",
      text: "lunchtime! ;)"
    }]
}

    [finstagram_post_shark, finstagram_post_whale, finstagram_post_marlin].to_s
end

#get  '/' do
 #   File.read ('app/views/index.html') 
#end 

get "/fizzbuzz" do 
list_of_numbers= ""

        for number in 1 ..100 do

            if number%3 ==0 && number%5 == 0
                list_of_numbers= list_of_numbers+  "fizzBuzz <br/>"
            elsif  number %3 ==0  
               list_of_numbers= list_of_numbers+  "Fizz <br/>"
            elsif number % 5 ==0 
                list_of_numbers= list_of_numbers+  "Buzz <br/>"

            else
                list_of_numbers= list_of_numbers+ "#{number}<br/> "
                   
            end
            
        
        end

        
        return list_of_numbers
end
