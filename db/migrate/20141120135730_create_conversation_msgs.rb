class CreateConversationMsgs < ActiveRecord::Migration
  def change
    create_table :conversation_msgs do |t|
      t.boolean :is_encrypted, :default => false
      t.text :message

      t.timestamps
    end
  end
end
