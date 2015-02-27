AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.count == 0

require 'faker'

Category.create(name: 'Торговые павильоны')
Category.create(name: 'Бытовки')
Category.create(name: 'Блок контейнеры')
Category.create(name: 'Посты охраны')
Category.create(name: 'Бани')

for j in 1..5 do
  for i in 1..4 do
    p = Product.create(
        name: Faker::Commerce.product_name,
        price: Faker::Number.number(5),
        description: Faker::Lorem.paragraph(5),
        category: Category.all.sample

    )
    ProductImage.create(
        product_id: p.id,
        image: File.open("app/assets/images/demo/products/#{i}.jpg")
    )
  end
end

for j in 1..3 do
  for i in 1..9 do
    Article.create(
        title: Faker::Lorem.sentence(3, true, 5),
        body: Faker::Lorem.paragraph(5, false, 10),
        image: File.open("app/assets/images/demo/news/#{i}.jpg")
    )
  end
end

for i in 1..4 do
  Review.create(
      name: Faker::Name.name,
      position: Faker::Name.title,
      body: Faker::Lorem.paragraph(3, false, 5),
      company_name: Faker::Company.name,
      company_url: Faker::Internet.url,
      photo: File.open("app/assets/images/demo/user-pic.png")
  )
end
