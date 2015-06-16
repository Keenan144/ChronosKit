class AddContentToBarcodes < ActiveRecord::Migration
  def change
    add_column :barcodes, :soss_number, :string
  end
end
