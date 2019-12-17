require_relative( '../db/sql_runner' )

class Member

  attr_accessor :name, :age
  attr_reader :id


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO members
    (
      name,
      age
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @age]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def lessons
    sql = "SELECT v* FROM lessons v INNER JOIN bookings b ON b.lesson_id = v.id WHERE b.member_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |lesson| Lesson.new(lesson) }
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |hash| Member.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end

  def update()
    sql = "UPDATE members
    SET
    (
      name,
      age
    )
    VALUES
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @age, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_items(member_data)
    return member_data.map { |member| Member.new(member) }
  end

end
