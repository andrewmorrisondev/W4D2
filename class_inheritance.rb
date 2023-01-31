class Employee

  attr_reader :name, :title, :salary, :boss, :employees
  attr_writer :boss, :employees

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @bonus = nil
    boss.employees << self if boss != nil
  end

  def boss=(boss)
    @boss = boss
    boss.employees << self
  end

  def bonus=(multiplier)
    if !self.is_a?(Manager)
      @bonus = self.salary * multiplier
    end
  end

  def bonus_calculator
    total_salaries = 0

    total_salaries += self.salary if !self.is_a?(Manager)

    self.employees.each do |employee|
      employee.bonus_calculator
    end
  end
end

class Manager < Employee
  attr_reader :employees
  
  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss=nil)
    @employees = []
  end

  def boss=(boss)
    super
  end
  
  
end