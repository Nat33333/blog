nata = User.create(first_name: 'Natalya',
                   last_name: 'Letkova',
                   avatar_name: 'Nata33',
                   password: 'qwertyqwerty',
                   email: 'letkova.natalya@yandex.ru',
                   admin: true,
                   confirmed_at: Time.now,
                   avatar_image: 'avatars/catt.jpg')
nata.save!
puts nata.inspect

user = User.create(first_name: 'PC',
                    last_name: 'Computer',
                    avatar_name: 'Computer',
                    password: '12345678',
                    email: 'nata.33rus@yandex.ru',
                    admin: false,
                    confirmed_at: Time.now,
                    computer: true)
user.save!
puts user.inspect