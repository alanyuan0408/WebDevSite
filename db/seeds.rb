# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  	Item.create(title: "Test Job #1", content: "Ruby on Rails Developer at Random Place", contact: "Test Contact Information 1", type_of: "JobPost")
  	Item.create(title: "Test Job #2", content: "Hardware Developer at Random Place 2", contact: "Test Contact Information 2", type_of: "JobPost")
  	Item.create(title: "Test Job #3", content: "Ruby on Rails Developer at Random Place 3", contact: "Test Contact Information 3", type_of: "JobPost")

  	Item.create(title: "Club Meeting", content: "Test Club Meeting This week", contact: "Optional Name of Contact", type_of: "ClubPost")

  	#Club.create!(title:"Testing Meeting", date: "September 20, 2014", content: "This is a basic overview of the events the club will be having and asking for inputs", send: "True")  