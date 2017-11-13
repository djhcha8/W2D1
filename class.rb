require 'byebug'
class Employee
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    add_self_to_employee 
  end

  def bonus(multiplier)
    @salary * multiplier
  end
  
  def add_self_to_employee 
    @boss.employees << self if @boss
  end
end



class Manager < Employee
    
  attr_accessor :employees
    
  def initialize(name, title, salary, boss = nil)
    @employees = []
    super
  end
  
  def bonus(multiplier)
    result = 0

    self.employees.each do |employee|
      result += employee.bonus(multiplier)
      result += employee.salary * multiplier if employee.is_a?(Manager)
    end
    
    result
  end

end
