#t.string   "item_id"
#t.string   "item_url"
#t.string   "item_title"
#t.datetime "item_date"
#t.text     "item_text"
#t.integer  "column_type"

job_list = [
  [ "title 1", 81831000 ],
  [ "title 2", 65447374 ],
  [ "title 3", 10839905 ],
  [ "title 4", 16680000 ],
  [ "title 5", 11831000 ],
  [ "title 6", 85447374 ],
  [ "title 7", 11839905 ],
  [ "title 8", 16620000 ]
]
job_list.each do |name, population|
  Feedbank.create(item_id: population, "item_url"=> "http://www.xyzpub.com",
	"item_date" => DateTime.now, item_text: name, "column_type" => "1")
end


