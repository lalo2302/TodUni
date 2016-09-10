def phase_attributes(overrides = {})
	{
		phase_number: 1,
		description: "This is a test phase",
		date_beginning: Date.new(2016,06,01),
		date_end: Date.new(2016,06,06),
		status: 1,
		hours: 120
	}.merge(overrides)
end
