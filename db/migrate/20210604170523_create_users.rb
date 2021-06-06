class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :title
      t.date :startdate
      t.date :enddate
      t.string :allday
      t.string :introduction

      t.timestamps
    end
  end
end
