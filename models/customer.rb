require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end


    def save()
      sql = " INSERT INTO customers
      (
        title,
        price
        ) VALUES
        (
          $1, $2
        )
        RETURNING id"
        values = [@name, @funds]
        films = SqlRunner.run(sql, values)[0]
        @id = films['id'].to_i
      end

      def self.all()
        sql = "SELECT * FROM films"
        values = []
        customers = SqlRunner.run(sql, values)
        result = films.map{|customer| Customer.new(customer)}
        return result
      end

      def self.delete()
        sql = "DELETE FROM customers"
        values = []
        SqlRunner.run(sql, values)
      end

      def update()
        sql = " UPDATE customers SET (
        title,
        price
        )=
        ($1, $2)
        WHERE id = $3"
        values = [@name, @funds, @id]
        Sql runner.run(sql, values)
      end
end
