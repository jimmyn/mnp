module ApplicationHelper

  def size(i)
    pattern = %w(1 3 2 2 4 4 4 3 1 2 2)
    "size#{pattern[i]}"
  end

end
