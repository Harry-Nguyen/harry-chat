# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   User.create(name: '', email: '', password: 1234)
User.create(name: 'Harry', email: 'a@a.com', password: '1234')
User.create(name: 'Jennifer', email: 'b@b.com', password: '1234')
User.create(name: 'Kate', email: 'c@c.com', password: '1234')
User.create(name: 'Jim', email: 'd@d.com', password: '1234')
User.create(name: 'Jack', email: 'e@e.com', password: '1234')
Message.create(sender_id: '1', recipient_id: '2', title: 'First message', body: 'This is the body', created_at: Time.now - 100000)
Message.create(sender_id: '1', recipient_id: '3', title: 'Second message', body: 'This is the body', created_at: Time.now - 90000)
Message.create(sender_id: '2', recipient_id: '1', title: 'Third message', body: 'This is the body', created_at: Time.now - 80000)
Message.create(sender_id: '3', recipient_id: '1', title: 'Forth message', body: 'This is the body', created_at: Time.now - 70000)
Message.create(sender_id: '4', recipient_id: '1', title: '5th message', body: 'This is the body', created_at: Time.now - 60000)
Friendship.create(owner_id: '1', friend_id: '2')
Friendship.create(owner_id: '1', friend_id: '3')