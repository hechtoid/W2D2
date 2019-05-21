class Employee
  attr_reader :name, :title, :boss, :salary
  def initialize(name, title, boss, salary)
    @name = name
    @title = title
    @boss = boss
    @salary = salary
  end

  def bonus(multiplier)
    salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, boss, salary)
    super
    @employees = []
  end

  def bonus(multiplier)
    (employees.map(&:salary).sum) * multiplier
  end
end



ned = Manager.new("Ned", "Founder", nil, 1000000)
darren = Manager.new('Darren', 'TA Manager', 'Ned', 78000)
shawna = Employee.new("Shawna", 'TA', 'Darren', 12000)
david = Employee.new("David", 'TA', 'Darren', 10000)

ned.employees.push(darren)

darren.employees.push(shawna,david)
ned.employees += p darren.employees


p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
