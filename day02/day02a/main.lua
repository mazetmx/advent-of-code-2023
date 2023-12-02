local function parse_input(file, input_table)
	local f = io.open(file, "r")

	for line in f:lines() do
		table.insert(input_table, line)
	end

	f:close()
end

local function main()
	local red_limit = 12
	local green_limit = 13
	local blue_limit = 14

	local input = {}
	local sum = 0

	-- store the lines from the text file in the input table
	parse_input("../input.txt", input)

	-- for each string in the input table
	for i, str in pairs(input) do
		local is_valid_game = false
		
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

		if max_red <= red_limit and max_green <= green_limit and max_blue <= blue_limit then
			is_valid_game = true
		end

		if is_valid_game then
			sum = sum + i
		end
	end

	print(sum)
end

main()
