class Image

  def initialize (data)
    @data = data
  end

  def locate_ones
    ones = []
    @data.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def image_blur (distance)
    distance.times do
    ones = locate_ones
      @data.each_with_index do |row, row_number|
        row.each_with_index do |item, col_number|
          ones.each do |found_row_number, found_col_number|

            if row_number == found_row_number && col_number == found_col_number
              @data[row_number -1][col_number] = 1 unless row_number == 0 #up
              @data[row_number +1][col_number] = 1 unless row_number >= @data.length - 1 #down
              @data[row_number][col_number -1] = 1 unless col_number == 0 #left
              @data[row_number][col_number +1] = 1 unless col_number >= row.length - 1 #right
            end
          end
        end
      end
    end
  end

  def output_image
    @data.each do |data|
      puts data.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0, 1, 0, 0, 0],
[0, 0, 0, 0, 0, 0],
[0, 0 ,0, 0, 0, 0],
[0, 0, 0, 0, 0, 0]
])

image.output_image
puts
image.image_blur(3)
image.output_image