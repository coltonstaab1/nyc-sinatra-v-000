class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all	
		erb :'figures/index'
	end	

	get '/figures/new' do
		erb :'figures/new'
	end
	
	post '/figures/new' do
		figure = Figure.create(params[:figure])
		if params[:title][:name] != ""
			title = Title.create(params[:title])
			figure.titles << title
		end

		if params[:landmark][:name] != ""
			landmark = Landmark.create(params[:landmark])
			figure.landmarks << landmark
		end

		redirect '/figures'		
	end

	get '/figures/:figure_id' do
		@figure = Figure.find_by_id(params[:figure_id])
		erb :'figures/show'
	end

	get '/figures/:figure_id/edit' do
		@figure = Figure.find_by_id(params[:figure_id])
		erb :'figures/edit'
	end

	post '/figures/:figure_id' do
		@figure = Figure.find_by_id(params[:figure_id])
		@figure.name = params[:figure][:name]

		if params[:landmark][:name] != ""
			landmark = Landmark.create(name: params[:landmark][:name])
			@figure.landmarks << landmark
		end
		@figure.save
		erb :'figures/show'

	end

end
