class CreateDefaultUser < ActiveRecord::Migration
  def self.up
    
    # Create admin role
    admin_role = Role.create(:name => 'admin')
    
    # Create default admin user
    user = User.create do |u|
      u.login = 'admin'
      u.password = u.password_confirmation = 'chester'
      u.email = APP_CONFIG[:admin_email]
    end
    
    # Add admin role to admin user
    user.roles << admin_role
    user.save
    
  end

  def self.down
    User.find_by_login('admin').destroy
    Role.find_by_name('admin').destroy
  end
end
