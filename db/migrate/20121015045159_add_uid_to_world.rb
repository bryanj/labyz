class AddUidToWorld < ActiveRecord::Migration
  def change
    add_column :worlds, :uid, :string
  end
end
