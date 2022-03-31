class CommentsController < ApplicationController
    def index
        @artwork = Artwork.find_by(id: params[:artwork_id])
        @user = User.find_by(id: params[:user_id])
        # @comments = []

        if !@artwork.nil?
           render json: @artwork.comments
        elsif !@user.nil?
            render json: @user.comments
        else
            render json: 'No comments found!', status: 404
        end

    
        
    end

    
    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            render json: @comment
          else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @comment = Comment.find_by(id: params[:id])
        
        if @comment
            render json: @comment
        else
            render json: 'No such comment exists', status: 404
        end

    end

    def destroy
        @comment = Comment.find(params[:id])
        @shadow_comment = @comment.dup
        render json: @shadow_comment
        @comment.destroy
    end
   
    private
    def comment_params
        params.require(:comment).permit(:body, :artwork_id, :user_id)
    end   
end