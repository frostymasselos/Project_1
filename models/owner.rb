require_relative( '../db/sql_runner.rb' )

class Owner

  attr_reader :id, :name, :address, :phone
  attr_reader :id, :name, :address, :phone

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @phone = options['phone']
  end

  def save()
    sql = "INSERT INTO owners
    (
      name,
      address,
      phone
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @address, @phone]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
