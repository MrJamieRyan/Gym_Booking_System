require_relative( '../db/sql_runner' )

class Member

  attr_reader :name, :membership, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @membership = options['membership']
    @age = options['age']
  end

  def save()
    sql = "INSERT INTO members
    (
      name,
      membership,
      age
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @membership, @age]
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

end
