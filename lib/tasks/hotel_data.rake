namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "slfan12@qq.com",
                 password: "23151914",
                 password_confirmation: "23151914",
                 pos:"管理员",
                 admin:true)
    39.times do |n|
      name = "example-#{n+1}"
      password = "password"
      pos="前台"
      User.create!(name: name,
                   password: password,
                   password_confirmation: password,
                   pos:pos)
    end
  end
end