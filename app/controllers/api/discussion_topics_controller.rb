module Api
  class DiscussionTopicsController < BaseController
    before_action :set_discussion_topic, only: [:show, :update, :destroy]

    def index
      @discussion_topics = DiscussionTopic.all
      render_json({ discussion_topics: serialize_array(DiscussionTopicSerializer, @discussion_topics )})
    end

    def show
      render_json({discussion_topic: serialize_hash(DiscussionTopicSerializer, @discussion_topic)})
    end

    def create
      @discussion_topic = @current_user.discussion_topics.build(discussion_topic_params)
      @discussion_topic.campaign_id = campaign.id
      @discussion_topic.save!
      render_json({discussion_topic: serialize_hash(DiscussionTopicSerializer, @discussion_topic)})
    end

    def update
      @discussion_topic.update!(discussion_topic_params)
      render_json({discussion_topic: serialize_hash(DiscussionTopicSerializer, @discussion_topic)})
    end

    def destroy
      @discussion_topic.destroy
      render_json("", 204)
    end

    private
      def set_discussion_topic
        @discussion_topic = campaign.discussion_topic.find(params[:id])
      end

      def campaign
        current_user.discussion_topics.includes(:discussion_topic).find(params[:campaign_id])
      end

      def discussion_topic_params
        params.require(:discussion_topic).permit(:title)
      end
  end
end