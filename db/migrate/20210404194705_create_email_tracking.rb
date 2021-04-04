class CreateEmailTracking < ActiveRecord::Migration[6.1]
  def change
    create_table :email_trackings do |t|
      t.references :email
      t.string :ip
      t.string :user_agent

      t.timestamps
    end
  end
end
