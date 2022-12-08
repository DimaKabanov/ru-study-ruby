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

      def search(array, query)
        return -1 if array.count.zero?

        iter = lambda do |start_index, end_index|
          return -1 if start_index > end_index

          middle_index = ((start_index + end_index) / 2).floor
          current_item = array[middle_index]

          return middle_index if current_item == query

          return iter.call(start_index, middle_index - 1) if current_item > query

          iter.call(middle_index + 1, end_index)
        end

        smallest_index = 0
        highest_index = array.count - 1

        iter.call(smallest_index, highest_index)
      end
    end
  end
end
