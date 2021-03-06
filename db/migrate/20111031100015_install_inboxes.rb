class InstallInboxes < ActiveRecord::Migration
  def self.up
    create_table :discussion_views do |t|
      t.references :user
      t.references :discussion
      t.timestamps
    end

    create_table :discussions do |t|
      t.references :user
      t.integer :messages_count, :default => 0 # counter cache
      t.boolean :is_private, :default => true
      t.timestamps
    end

    create_table :messages do |t|
      t.references :user
      t.references :discussion
      t.text :body
      
      t.timestamps
    end
    
    create_table :speakers do |t|
      t.references :user
      t.references :discussion
      
      t.timestamps
    end
  end

  def self.down
    drop_table :speakers
    drop_table :discussions
    drop_table :discussion_views
    drop_table :messages
  end
end