class AddIdentifierToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :identifier, :string
    add_column :questions, :user_count, :integer, :default => 0
  end
end
