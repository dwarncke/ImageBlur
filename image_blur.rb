class Image
  def initialize(data)
    @data = data
  end

  def output_image
    @data.each do |row|
      p row
    end
  end
end




image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image