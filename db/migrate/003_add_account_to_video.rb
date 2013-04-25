class AddAccountToVideo < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.integer :account_id
    end
    first_account = Account.first
    Video.all.each{ |p| p.update_attribute(:account, first_account)}
  end

  def self.down
    change_table :videos do |t|
      t.remove :account_id
    end
  end
end
