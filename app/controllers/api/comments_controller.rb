module Api
  class CommentsController < BaseController
    before_action :set_comment, only: [:show, :update, :destroy]

    def index
      @comments = current_user.comments
      render_json({ comments: serialize_array(CommentSerializer, @comments )})
    end

    def show
      render_json({comment: serialize_hash(CommentSerializer, @comment)})
    end

    def create
      @comment = current_user.comments.build(comment_params)
      @comment.campaign_id = campaign.id
      @comment.save!
      render_json({comment: serialize_hash(CommentSerializer, @comment)})
    end

    def update
      @comment.update!(comment_params)
      render_json({comment: serialize_hash(CommentSerializer, @comment)})
    end

    def destroy
      @comment.destroy
      render_json("", 204)
    end

    private
      def set_comment
        @comment = campaign.comments.find(params[:id])
      end

      def campaign
        Campaign.includes(:comments).find(params[:campaign_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
  end
end