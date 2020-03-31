helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

# frozen_string_literal: true
get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

get '/signup' do
  @user = User.new
  erb(:signup)
end

post '/signup' do
  # grab user input value

  email = params[:email]
  avatar_url = params[:avatar_url]
  username = params[:username]
  password = params[:password]

  @user = User.new(email: email, avatar_url: avatar_url, username: username, password: password)
  # if all user params are present
  if @user.save
    redirect to '/login'
  else

    erb(:signup)
  end
end

get '/login' do
  erb(:login)
end

post '/login' do
  username = params[:username]
  password = params[:password]

  # find user

  user = User.find_by(username: username)

  if user && user.password == password
    session[:user_id] = user.id
    redirect to('/')
  else
    @error_message = 'Login failed.'
    erb(:login)
 end
end

get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end

get '/finstagram_posts/new' do 
  @finstagram_post= FinstagramPost.new
  erb(:"finstagram_posts/new")
end

post '/finstagram_posts' do
  photo_url = params[:photo_url]

   @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

  if @finstagram_post.save
    redirect(to('/'))
  else
    erb(:"finstagram_posts/new")
  end
end

get '/finstagram_posts/:id' do
  @finstagram_post=FinstagramPost.find(params[:id])
  erb(:"finstagram_posts/show") 
end



# get  '/' do
#   File.read ('app/views/index.html')
# end

get '/fizzbuzz' do
  list_of_numbers = ''

  (1..100).each do |number|
    list_of_numbers = if number % 3 == 0 && number % 5 == 0
                        list_of_numbers + 'fizzBuzz <br/>'
                      elsif number % 3 == 0
                        list_of_numbers + 'Fizz <br/>'
                      elsif number % 5 == 0
                        list_of_numbers + 'Buzz <br/>'

                      else
                        list_of_numbers + "#{number}<br/> "

                        end
  end

  return list_of_numbers
end

get '/yellowPager' do
  return_string = get_string 'hello'
  return return_string
end

def get_string(string_of_character)
  # initialize the varaiable
  string_to_build = ''

  # check if character is 10 digits long
  return false if string_of_character.length != 10

  letter_to_number_map = {
    a: '2',
    b: '2',
    c: '2',
    d: '3',
    e: '3',
    f: '3',
    g: '4',
    h: '4',
    i: '4',
    j: '5',
    k: '5',
    l: '5',
    m: '6',
    n: '6',
    o: '6',
    p: '7',
    q: '7',
    r: '7',
    s: '7',
    t: '8',
    u: '8',
    v: '8',
    w: '9',
    x: '9',
    y: '9',
    z: '9'
  }

  # Break up to character
  # 1..string_of_character.length do |char_idx| #end

  (0..(string_of_character.length - 1)).each do |char_idx|
    my_letter = string_of_character[char_idx]
    # get asscoiated number
    my_number_to_add = letter_to_number_map.fetch[my_letter.to_sym]

    puts my_number_to_add

    string_to_build += my_number_to_add
  end

  my_string
end
