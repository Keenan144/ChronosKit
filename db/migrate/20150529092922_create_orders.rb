class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer  :bol_no, :limit => 8
      t.string  :created_at
      t.integer  :customer_order_no, :limit => 8
      t.string  :ship_from_company
      t.string  :ship_from_address
      t.string  :ship_from_zip_code
      t.string  :ship_to_company
      t.string  :ship_to_address
      t.string  :ship_to_zip_code
      t.string  :date
      t.string  :time
      t.string  :dow
      t.string  :month
      t.string  :hour
      t.string  :haserror
      t.string  :errorinfo
      t.string  :deleteme

      t.timestamps
    end
  end
end