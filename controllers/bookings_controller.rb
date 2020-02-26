require( 'sinatra' )
require('sinatra/contrib/all') if development?
require_relative( '../models/booking.rb' )
require_relative( '../models/lesson.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/action.rb' )

get '/bookings' do
  @bookings = Booking.all
  @actions = Action.all
  erb ( :"bookings/index" )
end

get '/bookings/new' do
  @lessons = Lesson.all
  @members = Member.all
  erb(:"bookings/new")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to("/bookings")
end

post '/bookings/:id/delete' do
  Booking.destroy(params[:id])
  redirect to("/bookings")
end