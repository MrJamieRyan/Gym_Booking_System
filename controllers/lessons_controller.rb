require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/lesson.rb' )
also_reload( '../models/*' )

get '/lessons' do
  @lessons = Lesson.all()
  erb ( :"lessons/index" )
end

get '/lessons/:id' do
  @lesson = Lesson.find(params['id'].to_i)
  erb( :"lessons/show" )
end
