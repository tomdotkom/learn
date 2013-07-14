class DevdetailsController < ApplicationController

def new

end

def create
	@medevlp = Medevlp.find(params[:medevlp_id])
	@devdetail = Medevlp.find(params[:medevlp_id]).devdetails.create(params[:devdetail])
	redirect_to medevlp_path(@medevlp)
end

def destroy
	@devdetail = Devdetail.find(params[:id])
	@devdetail.destroy
end

def edit
	@medevlp = Medevlp.find(params[:medevlp_id])
	@devdetail = Medevlp.find(params[:medevlp_id]).devdetails.find(params[:id])
end
def update
	@devdetail = Medevlp.find(params[:medevlp_id]).devdetails.find(params[:id])
	if @devdetail.update_attributes(params[:id])
		#redirect_to medevlp_path(@medevlp)
	else
		render action: 'edit'
	end
end
end
