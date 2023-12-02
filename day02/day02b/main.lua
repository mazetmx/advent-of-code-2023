local function parse_input(file, input_table)
	local f = io.open(file, "r")

	for line in f:lines() do
		table.insert(input_table, line)
	end

	f:close()
end

local function main()
	local input = {}
	local sum = 0

	-- store the lines from the text file in the input table
	parse_input("../input.txt", input)

	-- for each string in the input table
	for i, str in pairs(input) do
		local max_red = 0
		local max_green = 0
		local max_blue = 0

		for substr in str:gmatch("%d+%sred") do
			local red = tonumber(string.match(substr, "%d+"))
			if red > max_red then max_red = red end
		end
		
		for substr in str:gmatch("%d+%sgreen") do
			local green = tonumber(string.match(substr, "%d+"))
			if green > max_green then max_green = green end
		end

		for substr in str:gmatch("%d+%sblue") do
			local blue = tonumber(string.match(substr, "%d+"))
			if blue > max_blue then max_blue = blue end
		end
		
		sum = sum + (max_red * max_green * max_blue)
	end

	print(sum)
end

main()
