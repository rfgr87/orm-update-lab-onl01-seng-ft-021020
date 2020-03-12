require_relative "../config/environment.rb"

class Student

  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end
  
  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        album TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS students
      SQL
    DB[:conn].execute(sql)
  end
  
  
  def save
    sql = <<-SQL
      INSERT INTO student (name, grade)
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
  
  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student
  end 
    
  def self.new_from_db(array)
    student = Student.new(array[0], array[1], array[2])
    student 
  end
  
  def self.find_by_name(name)
    sql = <<-SQL
      SELECT * student
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]


end
