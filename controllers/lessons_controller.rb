require( 'sinatra' )
require('sinatra/contrib/all') if development?
require_relative( '../models/lesson.rb' )

get '/lessons' do
  @lessons = Lesson.all()
  erb ( :"lessons/index" )
end

get '/lessons/:id' do
  @lesson = Lesson.find(params['id'].to_i)
  erb( :"lessons/show" )
end
