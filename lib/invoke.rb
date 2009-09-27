module Enumerable
  def invoke(method_name, *params)
    collect{|item| item.send(method_name, *params)}
  end
end
