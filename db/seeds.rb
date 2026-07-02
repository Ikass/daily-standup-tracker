user = User.find_or_initialize_by(email_address: "test@example.com")
if user.new_record?
  user.name = "Test User"
  user.password = "password"
  user.time_zone = "Riga"
  user.save!
end

account = Account.find_or_initialize_by(name: "Test Company", user: user)
if account.new_record?
  account.addr1 = "123 Test Street"
  account.city = "Riga"
  account.country = "Latvia"
  account.save!
end

user.update!(account: account) unless user.account

Session.find_or_create_by!(user: user) do |s|
  s.ip_address = "127.0.0.1"
  s.user_agent = "seed script"
end

puts "Seeded: #{user.email_address} / password"
