User.delete_all

u1 = User.create! email: 'user@mail.com', password: '1111'

t1 = Table.create! table: '1', seats: '2', user_id: u1.id