module Api
  class CampaignsController < BaseController
    before_action :set_campaign, only: [:show, :update, :destroy]

    def index
      @campaigns = current_user.campaigns.includes(:comments, :discussion_topic, :tags)
      render_json({ campaigns: serialize_array(CampaignSerializer, @campaigns )})
    end

    def show
      render_json({campaign: serialize_hash(CampaignSerializer, @campaign)})
    end

    def create
      @campaign = current_user.campaigns.create!(campaign_params)
      render_json({campaigns: serialize_hash(CampaignSerializer, @campaign)}, 201)
    end

    def update
      @campaign.update!(campaign_params)
      render_json({campaign: serialize_hash(CampaignSerializer, @campaign)})
    end

    def destroy
      @campaign.destroy
      render_json("", 204)
    end

    private
    def set_campaign
      @campaign = current_user.campaigns.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:title, :purpose, :estimated_duration, tag_list: [])
    end
  end
end
