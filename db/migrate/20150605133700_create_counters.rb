class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.integer  :pagevisits
      t.integer  :barcodescreated
      t.integer  :barcodesgenerated
      t.integer  :cartonsgenerated
      t.integer  :palletsgenerated
      t.integer  :sossgenerated
      t.integer  :siteresets

      t.timestamps
    end
  end
end