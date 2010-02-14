class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
    end
    
    create_table :roles_users, :id => false do |t|
      t.belongs_to :role
      t.belongs_to :user
    end
    
    add_index :roles_users, :role_id
    add_index :roles_users, :user_id
  end

  def self.down
    drop_table :roles_users
    drop_table :roles
  end
end
