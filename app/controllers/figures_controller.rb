class FiguresController < ApplicationController

	get '/figures/new' do
		erb :'figures/new'
	end
	
	post '/figures/new' do
		figure = Figure.find_or_create_by(name: params[:figure][:name])
	end

end
