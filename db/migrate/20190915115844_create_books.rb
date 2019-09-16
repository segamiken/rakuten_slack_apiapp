class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
   	  t.string :title
   	  t.string :author
   	  t.string :smallImageUrl
   	  t.string :itemUrl

      t.timestamps
    end
  end
end
