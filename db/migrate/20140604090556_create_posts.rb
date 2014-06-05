class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :vacation
      t.datetime :from
      t.datetime :till
      t.string :vacation_type
      t.string :content

      t.timestamps
    end
  end
end
