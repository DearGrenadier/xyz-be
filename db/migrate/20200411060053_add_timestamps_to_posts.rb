class AddTimestampsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :created_at, :datetime
    add_column :posts, :updated_at, :datetime

    execute <<-SQL.squish
      UPDATE posts
      SET created_at = NOW(), updated_at = NOW()
    SQL

    change_column_null :posts, :created_at, false
    change_column_null :posts, :updated_at, false
  end
end
