class Employee

  attr_reader :name, :title, :salary,
  attr_accessor :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
    @bonus = nil
  end

  def boss=(@boss)
    if self.boss == nil ##CEO
      @boss = nil
    else
      @boss = boss
      #add self into boss employee array
      @boss.employees << self
    end
  end

  def bonus=(multiplier)
    if self.is_a?(Manager)
      ## total salary of all subemployees * multiplier 
      # manager.empl each do
      #collect
      total = 1

      self.employees.each do |employee|
        total *= @employee.bonus
      end
    else
      @bonus = self.salary * multiplier
    end
  end

  end



end

class Manager < Employee
  super
  
  def initialize
    @employees = []
    
  end

  
  
end