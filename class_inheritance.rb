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
    boss.employees << self unless boss.nil?
  end

  def bonus (multiplier)
    self.salary * multiplier
    # if !self.is_a?(Manager)
    #  return (self.salary * multiplier)
    # else
    #  return (bonus_calculator * multiplier)
    # end
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
    super(name, title, salary, boss)
    @employees = []
  end
  
  def boss=(boss)
    super
  end

  def bonus(multiplier)
    self.bonus_calculator * multiplier
  end
  
  def bonus_calculator
    # debugger
    bonus_calculator = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        bonus_calculator += employee.salary + employee.bonus_calculator
        # employee.bonus_calculator
      else
        bonus_calculator += employee.salary
        # bonus_calculator += employee.salary
      end
    end
    bonus_calculator
  end
  
  
  
  
end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000