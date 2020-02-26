require_relative( "../models/member.rb" )
require_relative( "../models/lesson.rb" )
require_relative( "../models/booking.rb" )

Booking.delete_all()
Member.delete_all()
Lesson.delete_all()

member1 = Member.new({
  "name" => "Jamie Ryan",
  "age" => "35",
  "address" => "1 High Street"
})

member1.save()

member2 = Member.new({
  "name" => "Lauren Osinski",
  "age" => "32",
  "address" => "1 High Street"
})

member2.save()

member3 = Member.new({
  "name" => "Loki Dog",
  "age" => "1",
  "address" => "1 High Street"
})

member3.save()

member4 = Member.new({
  "name" => "Jake Davitt",
  "age" => "15",
  "address" => "1 High Street"
})

member4.save()

lesson1 = Lesson.new({
  "name" => "Turning your upper body into a triangle",
  "lessondate" => "05/01/2020"
})

lesson1.save()

lesson2 = Lesson.new({
  "name" => "Mirror Selfie 101",
  "lessondate" => "05/01/2020"
})

lesson2.save()

lesson3 = Lesson.new({
  "name" => "How to go all the whey",
  "lessondate" => "05/01/2020"
})

lesson3.save()

lesson4 = Lesson.new({
  "name" => "Herbalife Sign Up",
  "lessondate" => "05/01/2020"
})

lesson4.save()

booking1 = Booking.new({
  "lesson_id" => lesson1.id,
  "member_id" => member1.id
})

booking1.save()

booking2 = Booking.new({
  "lesson_id" => lesson2.id,
  "member_id" => member2.id
})

booking2.save()

booking3 = Booking.new({
  "lesson_id" => lesson3.id,
  "member_id" => member4.id
})
booking3.save()

booking4 = Booking.new({
  "lesson_id" => lesson3.id,
  "member_id" => member1.id
})

booking4.save()


binding.pry
nil
