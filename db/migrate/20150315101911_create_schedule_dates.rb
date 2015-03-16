class CreateScheduleDates < ActiveRecord::Migration
  def change
    create_table :schedule_dates do |t|
      t.datetime :time
      t.references :user, index: true
      t.string :type

      t.timestamps null: false
    end
    add_foreign_key :schedule_dates, :users
  end
end
