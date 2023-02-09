require "./remover.rb"

class Animal
  ...

  def remove_leg
    remover = Remover.new()
    @number_of_legs = remover.decrease(@number_of_legs)
  end

  ...
end