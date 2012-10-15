# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
worlds = World.create([{name:'Labyrinth #1'}, {name:'Labyrinth #2'}])
questions = Question.create([{world:worlds.first, title:'Question #1', content:'Content #1'}, {world:worlds.first, title:'Question #2', content:'Content #2'}, {world:worlds.last, title:'Question #1', content:'Content #1'}])
links = Link.create([{question:questions.first, next_question:questions[1], answer:'answer'}])
