puts "🌱 Seeding spices..."

# Seed your database here
User.create(name: "North", password: "password", group_id: 1)
User.create(name: "West", password: "password", group_id: 2)

Message.create(body: "Hi everyone, I'm North", user_id: 1)
Message.create(body: "Hi everyone, I'm West", user_id: 2)

puts "✅ Done seeding!"
