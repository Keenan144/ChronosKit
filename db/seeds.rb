require 'csv'
bol_soss_report = CSV.read('bol_soss_report.csv')

Counter.create(pagevisits: 0, barcodescreated: 0, barcodesgenerated: 0, cartonsgenerated: 0, palletsgenerated: 0, sossgenerated: 0, siteresets: 1)

CSV.foreach('bol_soss_report.csv') do |row|
  Order.create(bol_no: row[0],created_at: row[1],customer_order_no: row[2],ship_from_company: row[3],ship_from_address: row[4],ship_from_zip_code: row[5],ship_to_company: row[6],ship_to_address: row[7],ship_to_zip_code: row[8],date: row[9],time: row[10],dow: row[11],month: row[12],hour: row[13],)
end