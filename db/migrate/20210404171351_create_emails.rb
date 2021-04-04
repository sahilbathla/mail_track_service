class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.text 'content'
      t.string 'to', index: true
      t.string 'from', index: true
      t.text 'subject'
      t.string 'cc'
      t.string 'bcc'
      t.string 'unique_id'
      t.string 'tracking_url'
      t.datetime 'opened_at' 
      t.index :unique_id, unique: true

      t.timestamps
    end
  end
end
