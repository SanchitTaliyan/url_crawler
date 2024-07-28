class CreateCrawledPages < ActiveRecord::Migration[7.1]
  def change
    create_table :crawled_pages do |t|
      t.string :url
      t.string :title
      t.text :description
      t.text :body

      t.timestamps
    end
  end
end
