# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Trip.create(name: "Vacation", destination: "Abuja", vip: true, price: 4.7, image: "https://images.unsplash.com/photo-1520046045453-547e1175391e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80", description: "This is a trip to Abuja")

Trip.create(name: "Business", destination: "Los Angeles", vip: true, price: 50.7, image: "https://images.unsplash.com/photo-1618694149123-4c95a5cd0657?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGJ1c3luZXNzJTIwc3RyaXAlMjBwbGFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60", description: "This is a business trip to Los Angeles")

Trip.create(name: "Pilgrimage", destination: "Vatican", vip: true, price: 100.7, image: "https://images.unsplash.com/photo-1616369415526-ce055dfa3a87?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw0Njk2OTYxfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60", description: "This is a trip to Vatican")

Trip.create(name: "Tourism", destination: "Dubai", vip: true, price: 150.7, image: "https://th.bing.com/th/id/R.5e3f89f420b3496558830db9ae0eda35?rik=8s88iYXVoH%2fuBg&riu=http%3a%2f%2fwww.hdwallpaper.nu%2fwp-content%2fuploads%2f2015%2f04%2fwallpaper-2812735.jpg&ehk=S5Fo4FkVkNOpYrXo3PWj2tiLuDrbOLXbSrF0LUyzHms%3d&risl=&pid=ImgRaw&r=0", description: "This is a tourism trip to Dubai")

Trip.create(name: "Medical", destination: "India", vip: true, price: 500.7, image: "https://th.bing.com/th/id/R.e7ed5ca46490b8be9652cdcf04b1c580?rik=hs8hm5aqbPH7mA&pid=ImgRaw&r=0", description: "This is a medical trip to India")

Trip.create(name: "Scholarship", destination: "Ukraine", vip: true, price: 600.7, image: "https://th.bing.com/th/id/OIP.UPT4nIUidoheYf30NjUJ5AHaE5?w=256&h=180&c=7&r=0&o=5&pid=1.7", description: "This is an educational(scholarship) trip to Ukraine")

Trip.create(name: "Sport", destination: "England", vip: true, price: 800.7, image: "https://www.moosetravel.ca/resources/image/Item-36/Sport1.jpg", description: "This is a sport trip to England")

Trip.create(name: "Movie", destination: "USA", vip: true, price: 1200.7, image: "https://media.istockphoto.com/photos/young-woman-travelling-with-kayak-in-nature-and-vlogging-picture-id1295131729?k=20&m=1295131729&s=612x612&w=0&h=fRMDSjie9xHobhg-VPZ6XagJ-wItT6Lqfukrk0xSyyk=", description: "This is a movie trip to USA")