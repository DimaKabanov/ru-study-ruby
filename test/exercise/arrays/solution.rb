module Exercise
  module Arrays
    class << self
      def find_max_item(array)
        max_item = array.first
        array.each { |item| max_item = item if item > max_item }
        max_item
      end

      def replace(array)
        max_item = find_max_item(array)
        array.map { |item| item.negative? ? item : max_item }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
