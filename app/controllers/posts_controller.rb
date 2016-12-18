class PostsController < ApplicationController

	def index
			@posts=Post.all
	end

	def new
		@post=Post.new
	end

	def create
		@post=Post.new(allowed_params)

		if @post.save
			redirect_to posts_path
		else
			redirect_to new_posts_path
		end
	end

	def edit
		@post=Post.find(params[:id])
	end

	def show
		@post=Post.find(params[:id])
	end

	def update
		@post=Post.find(params[:id])
		if @post.update_attributes(allowed_params)
			redirect_to posts_path
		else
			renedered 'new'
		end
	end

	def show
		@post=Post.find(params[:id])

	end
	def destroy
		@post=Post.find(params[:id])
		@post.destroy
		redirect_to posts_path

	end

private 
	def allowed_params
		params.require(:post).permit(:name,:age)
	end

end
