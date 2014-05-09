# Convert a integer value to English.
module Stringify
  # Requires an instance variable @value
  def stringify
    if @value == 1
      "One"
    elsif @value == 2
      "Two"
    elsif @value == 3
      "Three"
    end
  end
end