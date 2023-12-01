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
	for _, str in pairs(input) do
		local first_number = nil
		local second_number = nil
		-- for each character in the string
		for i = 1, #str do
			local char = str:sub(i, i)
			if type(tonumber(char)) == "number" then
				if first_number == nil then
					first_number = tonumber(char)
				end
				second_number = tonumber(char)
			end
		end
		if first_number ~= nil and second_number ~= nil then
			final_number = (first_number * 10 ) + second_number
		else
			final_number = 0
		end
		sum = sum + final_number
	end

	print(sum)
end

main()
