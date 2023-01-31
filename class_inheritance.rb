class Employee

  attr_reader :name, :title, :salary,
  attr_accessor :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
  end

  def boss=(@boss)
    if self.boss == nil
      @boss = nil
    else
      @boss = boss
    end
  end

end

class Manager < Employee
  
  def initialize
    @employees = []
    
  end

  
  
end