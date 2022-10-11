Table.delete_all
User.delete_all

u1 = User.create! email: 'user@mail.com', password: '1111'
puts "Created a new user: #{u1.email}"

t1 = Table.create! table: '1', seats: '2', user_id: u1.id
puts "Created a new table: #{t1.table}"
