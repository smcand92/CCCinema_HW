require_relative('../db/sql_runner')

class Film

attr_reader :id
attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = " INSERT INTO films
    (
      title,
      price
      ) VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@title, @price]
      films = SqlRunner.run(sql, values)[0]
      @id = films['id'].to_i
    end

    def self.all()
      sql = "SELECT * FROM films"
      values = []
      films = SqlRunner.run(sql, values)
      result = films.map{|film| Film.new(film)}
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM films"
      values = []
      SqlRunner.run(sql, values)
    end

    def update()
      sql = " UPDATE films SET (
      title,
      price
      )=
      ($1, $2)
      WHERE id = $3"
      values = [@title, @price, @id]
      SqlRunner.run(sql, values)
    end

end
