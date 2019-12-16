DROP TABLE bookings;
DROP TABLE members;
DROP TABLE lessons;

CREATE TABLE members
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  membership VARCHAR(255),
  age VARCHAR (255)
);

CREATE TABLE lessons
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  lessondate VARCHAR(255)
);

CREATE TABLE bookings
(
  id SERIAL primary key,
  lesson_id INT references lessons(id),
  member_id INT references members(id)
);
