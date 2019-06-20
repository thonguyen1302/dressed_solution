class DressedSolution
  def self.dressed_solution(inputs)
    inputs = inputs.split(' ').map{ |v| v.to_i }

    clothes = {
      1 => "hat",
      2 => "pants",
      3 => "shirt",
      4 => "shoes",
      5 => "socks"
    }

    optional_items = ["hat"]

    leave_index = 6

    result = []

    inputs.each do |cloth|
      if (cloth == leave_index)
        (result.length >= clothes.length - optional_items.length) ? result << "leave" : result << "fail"
        return result
      end

      if (cloth == clothes.key("shoes") && !result.include?("socks")) ||
         (cloth == clothes.key("shoes") && !result.include?("pants")) ||
         (cloth == clothes.key("hat")   && !result.include?("shirt"))
        result << "fail"
        return result
      end
      result << clothes[cloth] unless result.include?(clothes[cloth])
    end

    result
  end
end

print("Input: ")
inputs = gets.chomp
print("Output: ")
print(DressedSolution.dressed_solution(inputs).join(", "))
