class InstapicsController < ApplicationController
	before_action :find_pic ,only: [:show,:edit,:update,:destroy]
	def index
		@instapic = Instapic.all.order("created_at DESC")
	end

	def show
	end

	def destroy
		@instapic.destroy
		redirect_to root_path
	end

	def new
		@instapic = current_user.instapics.build
	end

	def update
		if @instapic.update(pics_params)
			redirect_to @instapic, notice: "Congratz Pic is Updated"
		else
			render 'edit'
		end
	end

	def edit
		
	end

	def create
		@instapic = current_user.instapics.build(pics_params)
		if @instapic.save 
			redirect_to @instapic, notice: "Yes it was created"
		else
			render  'new'
		end
	end

	private
	def pics_params	
		params.require(:instapic).permit(:title,:description,:image)
	end
	def find_pic
		@instapic = Instapic.find(params[:id])
	end

end
