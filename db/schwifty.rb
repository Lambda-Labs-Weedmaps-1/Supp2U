require 'yaml'

businesses = {
	1 => {
		street: '880 W Happy Canyon Rd. Suite 150',
		zip: 80_108,
		lat: '39.4271042',
		long: '-104.9021999'
	},
	2 => {
		street: '18601 Green Valley Ranch Blvd #101',
		zip: 80_249,
		lat: '39.784645',
		long: '-104.767735'
	},
	3 => {
		street: '103 North Rubey Dr.',
		zip: 80_403,
		lat: '39.765138',
		long: '-105.232381'
	},
	4 => {
		street: '7444 W Chatfield Ave',
		zip: 80_128,
		lat: '39.565504',
		long: '-105.081358'
	},
	5 => {
		street: '8181 E Arapahoe Rd',
		zip: 80_112,
		lat: '39.595713',
		long: '-104.893902'
	},
	6 => {
		street: '203 W Hampden Ave',
		zip: 80_110,
		lat: '39.654998',
		long: '-104.990235'
	},
	7 => {
		street: '4250 W Colfax Ave',
		zip: 80_204,
		lat: '39.740121',
		long: '-105.042513'
	},
	8 => {
		street: '3542 S Fox St', zip: 80_110, lat: '39.652076', long: '-104.994474'
	},
	9 => {
		street: '9625 E Arapahoe Rd Ste F',
		zip: 80_112,
		lat: '39.595028',
		long: '-104.817658'
	},
	10 => {
		street: '4850 Chambers Rd',
		zip: 80_239,
		lat: '39.785391',
		long: '-104.807725'
	},
	11 => {
		street: '8101 E Belleview Ave A-90',
		zip: 80_237,
		lat: '39.625717',
		long: '-104.893844'
	},
	12 => {
		street: '4085 E Mississippi Ave Suite D2',
		zip: 80_246,
		lat: '39.6969501',
		long: '-104.939877'
	},
	13 => {
		street: '698 Briggs St', zip: 80_516, lat: '40.051409', long: '-105.047824'
	},
	14 => {
		street: '1050 E 10th Ave',
		zip: 80_020,
		lat: '39.931529',
		long: '-105.054119'
	},
	15 => {
		street: '20981 E Smoky Hill Rd',
		zip: 80_015,
		lat: '39.608567',
		long: '-104.742429'
	},
	16 => {
		street: '3050 28th St', zip: 80_301, lat: '40.030425', long: '-105.258399'
	},
	17 => {
		street: '2439 S University Blvd',
		zip: 80_212,
		lat: '39.672307',
		long: '-104.959749'
	},
	18 => {
		street: '10230 E. Arapahoe Road',
		zip: 80_112,
		lat: '39.594615',
		long: '-104.86846'
	},
	19 => {
		street: '13697 E Iliff Ave',
		zip: 80_014,
		lat: '39.675442',
		long: '-104.830919'
	},
	20 => {
		street: '15510 E Centretech Pkwy',
		zip: 80_011,
		lat: '39.7244512',
		long: '-104.8085503'
	},
	21 => {
		street: '8162 S Holly St',
		zip: 80_122,
		lat: '39.569079',
		long: '-104.923022'
	},
	22 => {
		street: '1675 Larimer St',
		zip: 80_202,
		lat: '39.750116',
		long: '-104.996754'
	},
	23 => {
		street: '5708 E Colfax Ave',
		zip: 80_220,
		lat: '39.739878',
		long: '-104.921234'
	},
	24 => {
		street: '534 E Alameda Ave',
		zip: 80_209,
		lat: '39.71102',
		long: '-104.980792'
	},
	25 => {
		street: '12120 E Mississippi Ave',
		zip: 80_012,
		lat: '39.695338',
		long: '-104.846622'
	},
	26 => {
		street: '11651 W 64th Ave Unit A6',
		zip: 80_004,
		lat: '39.813843',
		long: '-105.129278'
	},
	27 => {
		street: '209 Yuma St', zip: 80_223, lat: '39.7208', long: '-105.015559'
	},
	28 => {
		street: '1635 28th St', zip: 80_301, lat: '40.015378', long: '-105.258504'
	},
	29 => {
		street: '1310 College Ave #230',
		zip: 80_302,
		lat: '40.007159',
		long: '-105.276041'
	},
	30 => {
		street: '7939 E Arapahoe Rd',
		zip: 80_112,
		lat: '39.59512',
		long: '-104.89775'
	},
	31 => {
		street: '284 S Logan St', zip: 80_209, lat: '39.71144', long: '-104.982284'
	},
	32 => {
		street: '284 S Logan St', zip: 80_209, lat: '39.711401', long: '-104.982379'
	},
	33 => {
		street: '9027 N. Harlan Street',
		zip: 80_031,
		lat: '39.859285',
		long: '-105.064053'
	},
	34 => {
		street: '10890 East Dartmouth Avenue',
		zip: 80_014,
		lat: '39.6597037',
		long: '-104.8606062'
	},
	35 => {
		street: '727 Colorado Blvd',
		zip: 80_206,
		lat: '39.728039',
		long: '-104.941182'
	},
	36 => {
		street: '2890 S Colorado Blvd',
		zip: 80_222,
		lat: '39.664657',
		long: '-104.938725'
	},
	37 => {
		street: '1528 East Colfax Avenue',
		zip: 80_218,
		lat: '39.73973',
		long: '-104.968901'
	},
	38 => {
		street: '7318 Federal Blvd',
		zip: 80_030,
		lat: '39.829612',
		long: '-105.024816'
	},
	39 => {
		street: '1699 S Colorado Blvd',
		zip: 80_222,
		lat: '39.685947',
		long: '-104.94144'
	},
	40 => {
		street: '11405 E Briarwood Ave',
		zip: 80_112,
		lat: '39.593745',
		long: '-104.856978'
	},
	41 => {
		street: '2422 S Downing St.',
		zip: 80_210,
		lat: '39.697838',
		long: '-104.961419'
	},
	42 => {
		street: '1250 S Buckley Rd',
		zip: 80_017,
		lat: '39.693861',
		long: '-104.789564'
	},
	43 => {
		street: '2426 Arapahoe Ave',
		zip: 80_302,
		lat: '40.013807',
		long: '-105.262699'
	},
	44 => {
		street: '1325 Broadway St',
		zip: 80_302,
		lat: '40.01017',
		long: '-105.276771'
	},
	45 => {
		street: '10001 E Iliff Ave',
		zip: 80_247,
		lat: '39.6752',
		long: '-104.870069'
	},
	46 => {
		street: '9360 S Colorado Blvd',
		zip: 80_126,
		lat: '39.543937',
		long: '-104.942102'
	},
	47 => {
		street: '5350 S Santa Fe Dr Ste E',
		zip: 80_120,
		lat: '39.619811',
		long: '-105.016354'
	},
	48 => {
		street: '990 W 6th Ave', zip: 80_204, lat: '39.725413', long: '-104.999494'
	},
	49 => {
		street: '9940 N Wadsworth Pkwy Ste 100',
		zip: 80_021,
		lat: '39.877077',
		long: '-105.093934'
	},
	50 => {
		street: '6610 Wadsworth Blvd',
		zip: 80_003,
		lat: '39.817068',
		long: '-105.080862'
	},
	51 => {
		street: '1355 Santa Fe Dr',
		zip: 80_204,
		lat: '39.737625',
		long: '-104.999118'
	},
	52 => {
		street: '1533 Champa St', zip: 80_202, lat: '39.746269', long: '-104.994749'
	},
	53 => {
		street: '2098 Youngfield St',
		zip: 80_228,
		lat: '39.748479',
		long: '-105.142343'
	},
	54 => {
		street: '477 N Sable Blvd',
		zip: 80_011,
		lat: '39.723404',
		long: '-104.819561'
	},
	55 => {
		street: '3531 S Logan St',
		zip: 80_113,
		lat: '39.652485',
		long: '-104.983548'
	},
	56 => {
		street: '7699 W 88th Ave',
		zip: 80_005,
		lat: '39.856519',
		long: '-105.083237'
	},
	57 => {
		street: '1250 S Buckley Rd',
		zip: 80_017,
		lat: '39.693861',
		long: '-104.789564'
	},
	58 => {
		street: '12650 W 64th Ave #B2',
		zip: 80_004,
		lat: '39.811568',
		long: '-105.141266'
	},
	59 => {
		street: '3700 W Quincy Ave',
		zip: 80_236,
		lat: '39.638141',
		long: '-105.035726'
	},
	60 => {
		street: '320 N Broadway Ste C',
		zip: 80_203,
		lat: '39.721426',
		long: '-104.987133'
	},
	61 => {
		street: '1387 E South Boulder Rd',
		zip: 80_027,
		lat: '39.987512',
		long: '-105.123507'
	},
	62 => {
		street: '4800 Baseline Rd #107',
		zip: 80_303,
		lat: '39.9985008',
		long: '-105.2343462'
	},
	63 => {
		street: '1750 16th St, Denver, CO',
		zip: 80_202,
		lat: '39.751964',
		long: '-105.001604'
	},
	64 => {
		street: '6886 S Clinton St', zip: 80_112, lat: '39.59179', long: '-104.8786'
	},
	65 => {
		street: '3600 Park Ave W',
		zip: 80_216,
		"foodTypes": ['Mexican Food', 'Breakfast', 'Cafes'],
		lat: '39.76683',
		long: '-104.994839'
	},
	66 => {
		street: '549 W Highlands Ranch Pkwy',
		zip: 80_129,
		lat: '39.549887',
		long: '-104.995894'
	},
	67 => {
		street: '3112 S Parker Rd',
		zip: 80_014,
		lat: '39.660116',
		long: '-104.852432'
	},
	68 => {
		street: '5027 W 120th Ave',
		zip: 80_020,
		lat: '39.914318',
		long: '-105.051792'
	},
	69 => {
		street: '9050 W 58th Ave',
		zip: 80_002,
		lat: '39.801818',
		long: '-105.098694'
	},
	70 => {
		street: '12033 Pecos St', zip: 80_234, lat: '39.914827', long: '-105.006234'
	},
	71 => {
		street: '2075 S University Blvd',
		zip: 80_210,
		lat: '39.679137',
		long: '-104.959902'
	},
	72 => {
		street: '990 Lincoln St.',
		zip: 80_203,
		lat: '39.731977',
		long: '-104.9860988'
	},
	73 => {
		street: '10981 S Parker Rd',
		zip: 80_134,
		lat: '39.517141',
		long: '-104.765042'
	},
	74 => {
		street: '2243 S Monaco Pkwy',
		zip: 80_222,
		lat: '39.675926',
		long: '-104.91296'
	},
	75 => {
		street: '4034 S Parker Rd',
		zip: 80_014,
		lat: '39.642336',
		long: '-104.827393'
	},
	76 => {
		street: '576 Dayton St', zip: 80_010, lat: '39.725102', long: '-104.875'
	},
	77 => {
		street: '3434 E 12th Ave', zip: 80_206, lat: '39.73493', long: '-104.946443'
	},
	78 => {
		street: '8000 E. Quincy Ave.',
		zip: 80_237,
		lat: '39.637477',
		long: '-104.898018'
	},
	79 => {
		street: '2610 Youngfield St',
		zip: 80_215,
		lat: '39.754258',
		long: '-105.142079'
	},
	80 => {
		street: '7301 S Santa Fe Dr Ste 410',
		zip: 80_120,
		lat: '39.584455',
		long: '-105.023602'
	},
	81 => {
		street: '5290 Arapahoe Rd',
		zip: 80_303,
		lat: '40.014671',
		long: '-105.213032'
	},
	82 => {
		street: '1600 Champa St Suite #200',
		zip: 80_202,
		lat: '39.746825',
		long: '-104.993407'
	},
	83 => {
		street: '1550 S Colorado Blvd',
		zip: 80_222,
		lat: '39.688456',
		long: '-104.939815'
	},
	84 => {
		street: '5302 Dtc Blvd', zip: 80_111, lat: '39.619601', long: '-104.888948'
	},
	85 => {
		street: '6600 W 120th Ave',
		zip: 80_020,
		lat: '39.912919',
		long: '-105.070058'
	},
	86 => {
		street: '2243 S Monaco Pkwy Unit 107',
		zip: 80_222,
		lat: '39.6759261',
		long: '-104.9129599'
	},
	87 => {
		street: '2243 S Monaco Pkwy Unit 107',
		zip: 80_222,
		lat: '39.676074',
		long: '-104.913163'
	},
	88 => {
		street: '1722 S Chambers Rd',
		zip: 80_017,
		lat: '39.684946',
		long: '-104.809782'
	},
	89 => {
		street: '316 West Washington Avenue',
		zip: '53703',
		lat: '39.729432',
		long: '-104.83192'
	},
	90 => {
		street: '12650 W 64th Ave',
		zip: 80_004,
		lat: '39.811305',
		long: '-105.140688'
	},
	91 => {
		street: '91 W Mineral Ave',
		zip: 80_120,
		lat: '39.573571',
		long: '-104.989835'
	},
	92 => {
		street: '6460 E Yale Ave',
		zip: 80_222,
		lat: '39.667008',
		long: '-104.913333'
	},
	93 => {
		street: '4136 E 8th Ave', zip: 80_220, lat: '39.729069', long: '-104.938556'
	},
	94 => {
		street: '2401 15th St Ste 80',
		zip: 80_202,
		lat: '39.75696',
		long: '-105.009033'
	},
	95 => {
		street: '420 E 120th Ave B-5',
		zip: 80_233,
		lat: '39.9128',
		long: '-104.981952'
	},
	96 => {
		street: '10731 E Alameda Ave',
		zip: 80_012,
		lat: '39.711706',
		long: '-104.863082'
	},
	97 => {
		street: '4085 E. Mississippi Ave. Unit C',
		zip: 80_246,
		lat: '39.696824',
		long: '-104.94'
	},
	98 => {
		street: '1621 W Canal Cir',
		zip: 80_120,
		lat: '39.572349',
		long: '-105.008774'
	},
	99 => {
		street: '1101 13th St', zip: 80_302, lat: '40.007514', long: '-105.27659'
	},
	100 => {
		street: '2416 Arapahoe Ave',
		zip: 80_302,
		lat: '40.014568',
		long: '-105.26286'
	},
	101 => {
		street: '909 Park St', zip: 80_109, lat: '39.379121', long: '-104.865924'
	},
	102 => {
		street: '1305 Broadway St',
		zip: 80_302,
		lat: '40.009788',
		long: '-105.276531'
	},
	103 => {
		street: '6375 Simms St.', zip: 80_004, lat: '39.80209', long: '-105.102486'
	},
	104 => {
		street: '891 14th St', zip: 80_202, lat: '39.744751', long: '-104.995785'
	},
	105 => {
		street: '9632 E Arapahoe Rd',
		zip: 80_112,
		lat: '39.594454',
		long: '-104.867385'
	},
	106 => {
		street: '12 E Arapahoe Rd',
		zip: 80_122,
		lat: '39.594784',
		long: '-104.987953'
	},
	107 => {
		street: '7355 Ralston Rd R-300',
		zip: 80_002,
		lat: '39.802343',
		long: '-105.077363'
	},
	108 => {
		street: '1311 Broadway St',
		zip: 80_302,
		lat: '40.009713',
		long: '-105.276696'
	},
	109 => {
		street: '6901 E Colfax Ave',
		zip: 80_220,
		lat: '39.740342',
		long: '-104.907925'
	},
	110 => {
		street: '15470 Andrews Dr',
		zip: 80_239,
		lat: '39.773621',
		long: '-104.808794'
	}
}

File.open("schwifty.yml", "w") { |file| file.write(businesses.to_yaml)}
