require "byebug"

class Employee

  attr_reader :name, :title, :salary, :boss, :employees
  attr_writer :boss, :employees

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.employees << self if boss != nil
  end

  def boss=(boss)
    @boss = boss
    boss.employees << self
  end

  def bonus (multiplier)
    if !self.is_a?(Manager)
     return (self.salary * multiplier)
    else
     return (bonus_calculator * multiplier)
    end
  end


  def bonus_calculator
    # debugger
    total_salaries = 0

    # total_salaries += self.salary if !self.is_a?(Manager)

    self.employees.each do |employee|
      if employee.is_a?(Manager)
        # total_salaries += employee.salary + 
        employee.bonus_calculator
      else
        total_salaries += employee.salary
      end
    end
    total_salaries
  end
end

#total salaries = 0
# self.employees.eachdo |employee|
#   if employee is a manager?
#     if yes - run the calcualtor again
#       if no - total salsairs+= employee.salary

class Manager < Employee
  attr_reader :employees
  
  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss=nil)
    @employees = []
  end

  def boss=(boss)
    super
  end

  def bonus_calculator
    super
  end


  
  
end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000