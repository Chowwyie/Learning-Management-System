# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

giles = User.create(name: 'Charlie Giles', email: 'giles.25@osu.edu', admin: true, password: 'password',
                    password_confirmation: 'password')
User.create(name: 'Alan Chow', email: 'chow.1@osu.edu', admin: false, password: 'password',
            password_confirmation: 'password')
User.create(name: 'Eddie Kubit', email: 'kubit.1@osu.edu', admin: false, password: 'password',
            password_confirmation: 'password')
User.create(name: 'Quinnan Hetrick', email: 'hetrick.1@osu.edu', admin: false, password: 'password',
            password_confirmation: 'password')
User.create(name: 'John Smith', email: 'smith.1@osu.edu', admin: false, password: 'password',
            password_confirmation: 'password')
User.create(name: 'Sam Jones', email: 'jones.1@osu.edu', admin: false, password: 'password',
            password_confirmation: 'password')
User.create(name: 'Olivia James', email: 'james.1@osu.edu', admin: false, password: 'password',
            password_confirmation: 'password')
User.create(name: 'Grace Baker', email: 'baker.1@osu.edu', admin: false, password: 'password',
            password_confirmation: 'password')
User.create(name: 'CJ Stroud', email: 'stroud.1@osu.edu', admin: false, password: 'password',
            password_confirmation: 'password')

announcement = giles.announcements.build(text: 'Hello Class, welcome to CSE3901 AU3901!')
announcement.save
announcement = giles.announcements.build(text: "Quick reminder, we don't have a syllabus.")
announcement.save
announcement = giles.announcements.build(text: 'Deadline for Tech Talk is approaching.')
announcement.save
announcement = giles.announcements.build(text: 'Do you SEIs.')
announcement.save
