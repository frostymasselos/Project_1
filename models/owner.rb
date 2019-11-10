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

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE owners
    SET
    (
      name,
      address,
      phone
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @address, @phone, @id]
    SqlRunner.run(sql, values)
  end

  def vets
    sql = "SELECT vets.* FROM vets
    INNER JOIN animals
    ON vets.id = animals.vet_id
    WHERE animals.owner_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |vet| Vet.new(vet)}
  end
  # Give all the vets that's operating
  # on it's animal.

#  sql = "SELECT films.* FROM films
#     INNER JOIN tickets
#     ON films.id = tickets.film_id
#     WHERE customer_id = $1"
# values = [@id]

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run (sql)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |hash| Owner.new( hash) }
  end

  def self.find( id )
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values )
    return Owner.new( results.first)
  end

end
