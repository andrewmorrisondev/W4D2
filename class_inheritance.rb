class Employee

  attr_reader :name, :title, :salary, :boss
  attr_writer :boss

  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @bonus = nil
  end

  def boss=(boss)
    if self.boss == nil ##CEO
      @boss = nil
    else
      @boss = boss
      #add self into boss employee array
      @boss.employees << self
    end
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