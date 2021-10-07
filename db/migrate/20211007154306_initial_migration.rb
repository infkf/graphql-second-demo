class InitialMigration < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :handle, null: false
      t.text :bio
      t.string :password_hash, null: false
      t.timestamps
    end

    create_table :tweets do |t|
      t.belongs_to :user
      t.text :message, null: false
      t.timestamps
    end

    create_table :badges do |t|
      t.string :description
      t.timestamps
    end

    create_table :badges_users do |t|
      t.belongs_to :user
      t.belongs_to :badge
    end

    add_column :users, :password_digest, :string, null: false
    add_index :users, :handle, unique: true
    remove_column :users, :password_hash

    create_table :user_relationships do |t|
      t.references :follower, null: false
      t.foreign_key :users, column: :follower_id, dependent: :destroy
      t.references :followee, null: false
      t.foreign_key :users, column: :followee_id, dependent: :destroy
      t.timestamps
      t.index [:follower_id, :followee_id], unique: true
    end
  end
end
