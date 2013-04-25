class AddFieldsToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.string :cover
    t.string :url
    end
  end

  def self.down
    change_table :videos do |t|
      t.remove :cover
    t.remove :url
    end
  end
end
