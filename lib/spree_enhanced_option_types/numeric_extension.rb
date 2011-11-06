Numeric.class_eval do
  def sign_symbol
    if self > 0
      "+"
    elsif self < 0
      "-"
    else
      ""
    end
  end
end