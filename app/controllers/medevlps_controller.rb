class MedevlpsController < ApplicationController

def index
	@medevlps = Medevlp.all
end

def create
	@medevlp = Medevlp.new(params[:medevlp])
	if @medevlp.save
		redirect_to medevlps_path
	else
		render action: 'new'
	end
end

def new
	@medevlp = Medevlp.new
end

def edit
	@medevlp = Medevlp.find(params[:id])
end

def show
	@medevlp = Medevlp.find(params[:id])
	@devdetail = Medevlp.find(params[:id]).devdetails.build
end

def update
	@medevlp = Medevlp.find(params[:id])
	if @medevlp.update_attributes(params[:medevlp])
		redirect_to medevlps_path
	else
		render action: 'edit'
	end
end

def destroy
	@medevlp = Medevlp.find(params[:id])
	@medevlp.destroy
	redirect_to medevlps_path
end

end
