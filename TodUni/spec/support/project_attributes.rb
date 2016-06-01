def project_attributes(overrides = {})
	{
		name: "Test project",
		description: "This projects is a test",
		coordinates: "21.1250° N, 101.6860° W",
		date_beginning: Date.new(2016,06,01),
		date_end: Date.new(2016,12,31),
		budget: 10000,
		status: 1
	}.merge(overrides)
end
