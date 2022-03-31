# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

drop_table: artwork_shares
drop_table: artworks
drop_table: users

User.create(username: 'picasso')
User.create(username: 'banksy')
User.create(username:'frida')
User.create(username:'da vinci')

Artwork.create(title: "Self-Portrait with Thorn Necklace and Hummingbird", image_url: "https://upload.wikimedia.org/wikipedia/en/1/1e/Frida_Kahlo_%28self_portrait%29.jpg",artist_id: User.find_by(username: 'frida').id)
Artwork.create(title: "Les Demoiselles d'Avignon", image_url: "https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/Les_Demoiselles_d%27Avignon.jpg/579px-Les_Demoiselles_d%27Avignon.jpg?20081229135437", artist_id: User.find_by(username: 'picasso').id)
Artwork.create(title: 'Girl with Balloon', image_url: "https://upload.wikimedia.org/wikipedia/commons/0/0c/Banksy_Girl_and_Heart_Balloon_%282840632113%29.jpg", artist_id: User.find_by(username: 'banksy').id)
Artwork.create(title:'Mona Lisa', image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/1200px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg", artist_id: User.find_by(username: 'da vinci').id)