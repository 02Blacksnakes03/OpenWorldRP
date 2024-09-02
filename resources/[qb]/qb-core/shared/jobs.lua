QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = false -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	unemployed = { label = 'Civilian', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Freelancer', payment = 10 } } },
	bus = { label = 'Bus', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	judge = { label = 'Honorary', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Judge', payment = 100 } } },
	lawyer = { label = 'Law Firm', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Associate', payment = 50 } } },
	reporter = { label = 'Reporter', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Journalist', payment = 50 } } },
	trucker = { label = 'Trucker', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	tow = { label = 'Towing', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Driver', payment = 50 } } },
	garbage = { label = 'Garbage', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Collector', payment = 50 } } },
	vineyard = { label = 'Vineyard', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Picker', payment = 50 } } },
	hotdog = { label = 'Hotdog', defaultDuty = true, offDutyPay = false, grades = { ['0'] = { name = 'Sales', payment = 50 } } },

	police = {
		label = 'Law Enforcement',
		type = 'leo',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Officer', payment = 75 },
			['2'] = { name = 'Sergeant', payment = 100 },
			['3'] = { name = 'Lieutenant', payment = 125 },
			['4'] = { name = 'Chief', isboss = true, payment = 150 },
		},
	},
	ambulance = {
		label = 'EMS',
		type = 'ems',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Paramedic', payment = 75 },
			['2'] = { name = 'Doctor', payment = 100 },
			['3'] = { name = 'Surgeon', payment = 125 },
			['4'] = { name = 'Chief', isboss = true, payment = 150 },
		},
	},
	vanilla = {
		label = 'Vanilla Unicorn',
		defaultDuty = true, -- If whenever you see the job your defaultly on duty
		offDutyPay = false, -- If you want employees to be paid even when theyre not on duty/off duty ( THIS IS IN GAME NOT WHEN YOUR OFFLINE COMPLETELY)
		grades = {
            ['0'] = {
                name = 'Runner', -- NAME OF THE GRADE
                payment = 650 -- PAYMENT FOR THIS GRADE ( EVERY 30 MINS OR ACCORDING TO YOUR loops.lua)  -- Configure According To Your Economy
            },
            ['1'] = {
                name = 'Barista',
                payment = 950, -- Configure According To Your Economy
            },
            ['2'] = {
                name = 'Head Barista',
                isboss = true,
                payment = 1400, -- Configure According To Your Economy
            },
            ['3'] = {
                name = 'Asst. Manager',
                isboss = true,
                payment = 1600,
            },
            ['4'] = {
                name = 'Manager',
                isboss = true,
                payment = 2000, -- Configure According To Your Economy
            },
        },
	},
	["comic"] = {
		label = "Trading Card Co.",
		defaultDuty = true,
		grades = {
			['0'] = {
				name = "TC Grader",
				payment = 75
			},
			['1'] = {
				name = "TC Worker",
				payment = 100
			},
			['2'] = {
				name = "TC Manager",
				payment = 125,
			},
			['3'] = {
				name = "TC Owner",
				payment = 150,
				isboss = true,
			},
		},
	},
	burgershot = {
		label = "Burgershot",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = "Trainee", payment = 50 },
			['1'] = { name = "Employee", payment = 75 },
			['2'] = { name = "Burger Flipper", payment = 100 },
			['3'] = { name = "Manager", payment = 125 },
			['4'] = { name = "Owner", isboss = true, payment = 150 },
		},
	},	
	['uwu'] = {
		label = 'UwU Cat Cafe',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Novice',
                payment = 50
            },
			['1'] = {
                name = 'Employee',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Advanced',
                payment = 125
            },
			['4'] = {
                name = 'Boss',
				isboss = true,
                payment = 150
            },
        },
	},
	['taco'] = {
		label = 'Mexican Restaurant',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {
				name = 'Cook',
				payment = 1750,
			},
			['1'] = {
				name = 'Chef',
				payment = 1750,
			},
			['1'] = {
				name = 'Adv.Chef',
				payment = 1750,
			},
			['2'] = {
				name = 'Manager',
				isboss = true,
				payment = 1750,
			},
			['3'] = {
				name = 'Owner',
				isboss = true,
				payment = 2000,
			},
		},
	},	
	pawn = {
		label = 'Pawn Shop',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = {name = 'Runner', payment = 650},
			['1'] = {name = 'SalesMan', payment = 950},
			['2'] = {name = 'Trader', isboss = true, payment = 1400},
			['3'] = {name = 'Asst. Manager', isboss = true, payment = 1600},
			['4'] = {name = 'Manager', isboss = true, payment = 2000},
		},
	},
	realestate = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'House Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Broker', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	['club77'] = {
		label = 'club77',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 25
            },
			['1'] = {
                name = 'Employee',
                payment = 40
            },
			['2'] = {
                name = 'Bar Staff',
                payment = 50
            },
			['3'] = {
                name = 'Dancer',
                payment = 80
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 100
            },
            ['5'] = {
                name = 'Owner',
				isboss = true,
                payment = 150
            },
        },
	},
	taxi = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Driver', payment = 75 },
			['2'] = { name = 'Event Driver', payment = 100 },
			['3'] = { name = 'Sales', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	cardealer = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Showroom Sales', payment = 75 },
			['2'] = { name = 'Business Sales', payment = 100 },
			['3'] = { name = 'Finance', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	mechanic = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	mechanic2 = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	mechanic3 = {
		label = 'LS Customs',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	beeker = {
		label = 'Beeker\'s Garage',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
	bennys = {
		label = 'Benny\'s Original Motor Works',
		type = 'mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
		},
	},
}
