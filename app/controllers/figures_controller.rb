class FiguresController < ApplicationController

	get '/figures/new' do
		erb :'figures/new'
	end
	
	post '/figures/new' do
		figure = Figure.find_or_create_by(name: params[:figure][:name])
		figure.title_ids = params[:figure][:title_ids]
		landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
		binding.pry		
	end

end
