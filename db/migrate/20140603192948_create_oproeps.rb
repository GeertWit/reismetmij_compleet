class CreateOproeps < ActiveRecord::Migration
  def change
    create_table :oproeps do |t|

      t.timestamps
    end
  end
end
