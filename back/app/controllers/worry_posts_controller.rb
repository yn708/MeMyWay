class WorryPostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]

    def index
        @posts = WorryPost.all
        render json: @posts
      end
    
      def show
        render json: @post
      end
        
      def create
        @post = WorryPost.new(post_params)
        if @post.save
          render json: @post, status: :created
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_
        end
      end
    
      def destroy
        @post.destroy
        render json: {}, status: :no_content
      end
    
      private

      def set_post
        @post = WorryPost.find(params[:id])
      end

      def post_params
        params.require(:worry_post).permit(:title, :content)
      end

end
