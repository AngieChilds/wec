class CreateWebinars < ActiveRecord::Migration
  def change
    create_table :webinars do |t|
      t.datetime :date
      t.string :subject
      t.text :detail
      t.string :presenter
      t.text :info
      t.string :url

      t.timestamps
    end
  end
end
