class User
  attr_accessor :name, :email
  
  def initialize(attributes = {})
    @name   = attributes[:name]
    @email  = attributes[:email]
  end
  
  def formatted_email
    format_email(@name, @email)
  end
  
  private
  def format_email(name, email)
    "#{name} <#{email}>"
  end
end