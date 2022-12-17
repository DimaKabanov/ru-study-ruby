module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        index = 0

        while index < size
          yield self[index]
          index += 1
        end

        self
      end

      # Написать свою функцию my_map
      def my_map
        result = []

        my_each { |element| result << yield(element) }

        self.class.new result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = []

        my_each { |element| result << element unless element.nil? }

        self.class.new result
      end

      # Написать свою функцию my_reduce
      def my_reduce; end
    end
  end
end
