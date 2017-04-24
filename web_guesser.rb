require 'sinatra'
require 'sinatra/reloader'

@@number = rand(100)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => @@number, :message => message}
end

def check_guess(guess)
  if guess.nil?
    message = ''
  elsif guess.to_i > (@@number + 5)
   message = 'your guess is way too high'
  elsif guess.to_i < (@@number - 5)
   message = 'your guess is way too low'
  elsif guess.to_i > @@number
    message = 'your guess is too high'
  elsif guess.to_i < @@number
    message - 'your guess is too low'
  elsif guess.to_i == @@number
    message = "you got it right! The secret number is #{@@number}"
  end
end

