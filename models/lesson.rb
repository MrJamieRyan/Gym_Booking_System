require_relative( '../db/sql_runner' )

class Lesson

  attr_reader( :name, :lessondate, :id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @lessondate = options['lessondate'].to_i
  end

  def save()
    sql = "INSERT INTO lessons
    (
      name,
      lessondate
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @lessondate]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def members()
    sql = "SELECT z.* FROM members z INNER JOIN bookings b ON b.member_id = z.id WHERE b.lesson_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |member| Member.new(member) }
  end

  def self.all()
    sql = "SELECT * FROM lessons"
    results = SqlRunner.run( sql )
    return results.map { |lesson| Lesson.new( lesson ) }
  end

  def self.find( id )
    sql = "SELECT * FROM lessons
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Lesson.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM lessons"
    SqlRunner.run( sql )
  end

end
