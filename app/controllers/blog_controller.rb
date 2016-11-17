class BlogController < ApplicationController
	def index
		@posts = Post.all.reverse
	end

	def create
		Post.create(writer: params["name"], content: params[:content])
		redirect_to :root
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to :root
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		post.writer = params[:name]
		post.content = params[:content]
		post.save
		redirect_to :root
	end

	def comment
		Comment.create(post_id: params[:post_id], msg: params[:comment])
		redirect_to :root
	end
end
