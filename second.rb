#Example 1
def get_addresses
  addresses = []
  users = User.all
  users.each do |user|
    addresses << user.address if user.address.city.present?
  end
  addresses
end

def get_addresses
  addresses = []

  users = User.includes(:address)

  users.each do |user|
    addresses << user.address if user.address.city.present?
  end
  
  addresses
end

# Example 2:
class Greeting
  def name=(value)
    @name = value
  end
  
  def name
    @name
  end
end

class Greeting
  attr_accessor :name
end

# Example 3:
def sum(a, b)
  a + b
end

def sum(p, q, r)
  p + q + r
end

def sum(x, y, z, w)
  x + y + z + w
end


def sum(*args)
  case args.size
  when 2
    args[0] + args[1]
  when 3
    args[0] + args[1] + args[2]
  when 4
    args[0] + args[1] + args[2] + args[3]
  end
end