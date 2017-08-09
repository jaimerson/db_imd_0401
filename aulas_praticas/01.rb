require 'rubygems'
require 'bundler/setup'
Bundler.setup(:default)
require 'doterd'

FILENAME='01'

at_exit {
  system("xdg-open #{FILENAME}.dot.png")
}

include Doterd::Autodraw

config do |c|
  c[:dot_filename] = "./#{FILENAME}.dot"
end

table(:clients) do
  id
  name
  birthday
  email
  phone
end

table(:appointments) do
  id
  time
  status
  price

  scheduled_at
  canceled_at
  completed_at
end

table(:ratings) do
  id
  score
  comment
end

table(:providers) do
  id
  name
end

table(:services) do
  id
  name
  price
  duration
end

table(:employees) do
  id
  name
  cpf
  phone
  commission
end

table(:timeslots) do
  id
  day_of_week
  start_time
  end_time
end

_1_N :providers, :employees
_1_N :providers, :services
_1_N :clients, :appointments
_1_N :services, :appointments
_1_1 :appointments, :ratings
_1_N :services, :timeslots
_1_N :employees, :appointments

# _N_N :users  , :followings
# _1_N :users  , :likes
# _1_N :users  , :tweets
# _1_N :users  , :retweets
# _1_N :tweets , :retweets
# _1_N :tweets , :likes
