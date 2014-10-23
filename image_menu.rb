require "./image_array.rb"
puts "File path?"
file_path = gets.chomp
img = ImageArray.new(file_path)
# open an image array at the given file path

while true
	puts "Effect? (bw, inv, random, q to quit)"
	effect = gets.chomp

	if effect == "bw"
		img.each do |row|
		        row.each do |pixel|
				pixel_gray = (pixel.red + pixel.blue + pixel.green)/3
				pixel.green = pixel_gray
				pixel.red = pixel_gray
				pixel.blue = pixel_gray
			end
		end

	img.write("./BWimage.jpg")
break
	elsif effect == "inv"
		img.each do |row|
		        row.each do |pixel|
				pixel.red = img.max_intensity - pixel.red
				pixel.blue = img.max_intensity - pixel.blue
				pixel.green = img.max_intensity - pixel.green
				end
			end

		img.write("./InvImage.jpg")
break
	elsif effect == "random"
#Random means each different picture will have a different array of pixels
		img.each do |row|
			row.each do |pixel|
				pixel_red = pixel.red
				pixel_green = pixel.green
				pixel_blue = pixel.blue
				pixel.red = (rand > 0.5 ? pixel_green : pixel_blue)
				pixel.green = (rand > 0.5 ? pixel_blue : pixel_red )
				pixel.blue = (rand > 0.5 ? pixel_green : pixel_red )
			end
		end
	img.write("./RandomPic4.jpg")
break

	elsif effect == 'q'
		break
	else
		puts "Not a valid effect!"
	end

end
