class LandmarksController < ApplicationController

	get '/landmarks' do
		@landmarks = Landmark.all
		erb :'landmarks/index'
	end

	get '/landmarks/new' do	
		erb :'landmarks/new'
	end

	post '/landmarks/new' do
		@landmark = Landmark.create(params[:landmark])
		redirect '/landmarks'
	end

	get '/landmarks/:landmark_id' do
		@landmark = Landmark.find_by_id(params[:landmark_id])
		erb :'landmarks/show'		
	end

	get '/landmarks/:landmark_id/edit' do
		@landmark = Landmark.find_by_id(params[:landmark_id])
		erb :'landmarks/edit'
	end

	post '/landmarks/:landmark_id' do
		@landmark = Landmark.find_by_id(params[:landmark_id])
		@landmark.name = params[:landmark][:name]
		@landmark.year_completed = params[:landmark][:year_completed]
		@landmark.save
		binding.pry
		erb :'landmarks/show'
	end

end
