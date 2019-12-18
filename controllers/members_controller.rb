require( 'sinatra' )
require( 'sinatra/contrib/all')
require_relative( '../models/member/')


also_reload( '../models/*' )

get '/members/?' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/new' do
  @member = Member.new(params)
  @member.save
  erb(:"members/new")
end

get '/members/:id/?' do
  @member = Member.find(params[:id])
  erb(:"members/show")
end

get '/members/:id/edit' do
  @member = Member.find(params[:id])
  erb(:"members/edit")
end

post '/members/:id/update' do
  Member.new(params).update
  erb(:"members/:id/update")
end

post '/members/?' do
  @member = Member.new(params)
  @member.save
  erb(:"members/create")
end
