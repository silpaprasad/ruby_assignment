class CreateSiteDetails < ActiveRecord::Migration
  def change
    create_table :site_details do |t|
      t.string :url
      t.string :email
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
