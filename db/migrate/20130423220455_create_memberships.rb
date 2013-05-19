class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :member_id
      t.integer :member_of_id

      t.timestamps
    end

    add_index :memberships, :member_id
    add_index :memberships, :member_of_id
    add_index :memberships, [:member_id, :member_of_id], unique: true

  end
end
