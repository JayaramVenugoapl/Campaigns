class CreateDiscussionTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :discussion_topics do |t|
      t.string :title
      t.references :campaign, null: false, foreign_key: true, index: false
      t.references :user, null: false, foreign_key: true, index: false

      t.timestamps
    end
    add_index :discussion_topics, [:user_id, :campaign_id], unique: true
  end
end
