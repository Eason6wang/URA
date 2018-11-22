%
% Quality correlate over benchmarks in the Photographic Survey.
%
function cmd_quality()

%
% Using quality correlate, choose smallest value for "middle" method
% that gives a greater than or equal quality correlate compared to
% set covering method. If no value for middle gives a greater than
% or equal value, choose the smallest value that gives the highest
% quality correlate.
%
determinedByHand = [ ...
 5, ... % 507:                    5
 9, ... % AhwahneeGreatLounge:    9
 7, ... % AirBellowsGap:          7
 5, ... % AmikeusBeaverDamPM1:    5
 3, ... % AmikeusBeaverDamPM2:    3
 5, ... % ArtistPalette:          5
 3, ... % BalancedRock:           3
 3, ... % BandonSunset1:          3
 5, ... % BandonSunset2:          5
 5, ... % BarHarborPresunrise:    5
 5, ... % BarHarborSunrise:       5
 5, ... % BenJerrys:              5
 3, ... % BigfootPass:            3
 3, ... % BloomingGorse1:         3
 3, ... % BloomingGorse2:         3
 3, ... % CadesCove:              3
 3, ... % CanadianFalls:          3
 5, ... % CemeteryTree1:          5
 5, ... % CemeteryTree2:          5
 3, ... % DelicateArch:           3
 3, ... % DelicateFlowers:        3
 3, ... % DevilsBathtub:          3
 3, ... % DevilsGolfCourse:       3
 5, ... % DevilsTower:            5
 3, ... % ElCapitan:              3
 3, ... % Exploratorium1:         3
 3, ... % Exploratorium2:         3
 5, ... % Flamingo:               5
 3, ... % FourCornersStorm:       3
 5, ... % Frontier:               5
 5, ... % GeneralGrant:           5
 3, ... % GeneralSherman:         3
 3, ... % GoldenGate1:            3
 5, ... % GoldenGate2:            5
 5, ... % HalfDomeSunset:         5
 3, ... % HallofFame:             3
 7, ... % HancockKitchenInside:   7
 5, ... % HancockKitchenOutside:  5
 3, ... % HancockSeedField:       3
 3, ... % HDRMark:                3
 3, ... % HooverDam:              3
 7, ... % HooverGarage:           7
 5, ... % JesseBrownsCabin:       5
 3, ... % KingsCanyon:            3
 5, ... % LabBooth:               5
 9, ... % LabTypwriter:           9
 7, ... % LabWindow:              7
 5, ... % LadyBirdRedwoods:       5
 9, ... % LasVegasStore:          9
 5, ... % LetchworthTeaTable1:    5
 5, ... % LetchworthTeaTable2:    5
 5, ... % LittleRiver:            5
 7, ... % LuxoDoubleChecker:      7
 3, ... % M3MiddlePond:           3
 3, ... % MackinacBridge:         3
 3, ... % MammothHotSprings:      3
 3, ... % MasonLake1:             3
 3, ... % MasonLake2:             3
 5, ... % McKeesPub:              5
 3, ... % MiddlePond:             3
 3, ... % MirrorLake:             3
 5, ... % MtRushmore1:            5
 5, ... % MtRushmore2:            5
 5, ... % MtRushmoreFlags:        5
 3, ... % NiagaraFalls:           3
 3, ... % NorthBubble:            3
 3, ... % OCanadaLights:          3
 5, ... % OCanadaNoLights:        5
 5, ... % OldFaithfulInn:         5
 3, ... % OtterPoint:             3
 3, ... % PaulBunyan:             3
 3, ... % PeckLake:               3
 7, ... % Peppermill:             7
 3, ... % Petroglyphs:            3
 3, ... % RedwoodSunset:          3
 3, ... % RITTiger:               3
 7, ... % RoadsEndFireDamage:     7
 5, ... % RoundBarnInside:        5
 3, ... % RoundStoneBarn:         3
 3, ... % Route66Museum:          3
 3, ... % SequoiaRemains:         3
 3, ... % SmokyTunnel:            3
 5, ... % SouthBranchKingsRiver:  5
 3, ... % SunsetPoint1:           3
 3, ... % SunsetPoint2:           3
 3, ... % TaughannockFalls:       3
 3, ... % TheGrotto:              3
 5, ... % TheNarrows1:            5
 3, ... % TheNarrows2:            3
 5, ... % TheNarrows3:            5
 3, ... % TunnelView1:            3
 3, ... % TunnelView2:            3
 3, ... % TupperLake1:            3
 3, ... % TupperLake2:            3
 3, ... % UpheavalDome:           3
 5, ... % URChapel1:              5
 7, ... % URChapel2:              7
 7, ... % WaffleHouse:            7
 5, ... % WallDrug:               5
 5, ... % WestBranchAusable1:     5
 5, ... % WestBranchAusable2:     5
 7, ... % WillyDesk:              7
 5, ... % WillySentinel:          5
 3, ... % YosemiteFalls:          3
 3];    % Zentrum:                3

determinedBySetCovering = [ ...
 3, ...	% 507, 3
 7, ...	% AhwahneeGreatLounge, 7
 3, ...	% AirBellowsGap, 3
 5, ...	% AmikeusBeaverDamPM1, 5
 5, ...	% AmikeusBeaverDamPM2, 5
 3, ...	% ArtistPalette, 3
 3, ...	% BalancedRock, 3
 3, ...	% BandonSunset1, 3
 3, ...	% BandonSunset2, 3
 5, ...	% BarHarborPresunrise, 5
 3, ...	% BarHarborSunrise, 3
 5, ...	% BenJerrys, 5
 3, ...	% BigfootPass, 3
 3, ...	% BloomingGorse1, 3
 5, ...	% BloomingGorse2, 5
 3, ...	% CadesCove, 3
 3, ...	% CanadianFalls, 3
 5, ...	% CemeteryTree1, 5
 5, ...	% CemeteryTree2, 5
 3, ...	% DelicateArch, 3
 3, ...	% DelicateFlowers, 3
 5, ...	% DevilsBathtub, 5
 3, ...	% DevilsGolfCourse, 3
 3, ...	% DevilsTower, 3
 3, ...	% ElCapitan, 3
 3, ...	% Exploratorium1, 3
 5, ...	% Exploratorium2, 5
 9, ...	% Flamingo, 9
 3, ...	% FourCornersStorm, 3
 9, ...	% Frontier, 9
 3, ...	% GeneralGrant, 3
 3, ...	% GeneralSherman, 3
 3, ...	% GoldenGate1, 3
 5, ...	% GoldenGate2, 5
 5, ...	% HDRMark, 5
 5, ...	% HalfDomeSunset, 5
 3, ...	% HallofFame, 3
 3, ...	% HancockKitchenInside, 3
 3, ...	% HancockKitchenOutside, 3
 3, ...	% HancockSeedField, 3
 3, ...	% HooverDam, 3
 3, ...	% HooverGarage, 3
 3, ...	% JesseBrownsCabin, 3
 3, ...	% KingsCanyon, 3
 5, ...	% LabBooth, 5
 5, ...	% LabTypwriter, 5
 3, ...	% LabWindow, 3
 5, ...	% LadyBirdRedwoods, 5
 9, ...	% LasVegasStore, 9
 3, ...	% LetchworthTeaTable1, 3
 3, ...	% LetchworthTeaTable2, 3
 5, ...	% LittleRiver, 5
 5, ...	% LuxoDoubleChecker, 5
 5, ...	% M3MiddlePond, 5
 3, ...	% MackinacBridge, 3
 3, ...	% MammothHotSprings, 3
 3, ...	% MasonLake1, 3
 3, ...	% MasonLake2, 3
 7, ...	% McKeesPub, 7
 3, ...	% MiddlePond, 3
 3, ...	% MirrorLake, 3
 3, ...	% MtRushmore1, 3
 3, ...	% MtRushmore2, 3
 5, ...	% MtRushmoreFlags, 5
 3, ...	% NiagaraFalls, 3
 3, ...	% NorthBubble, 3
 5, ...	% OCanadaLights, 5
 3, ...	% OCanadaNoLights, 3
 3, ...	% OldFaithfulInn, 3
 7, ...	% OtterPoint, 7
 3, ...	% PaulBunyan, 3
 3, ...	% PeckLake, 3
 9, ...	% Peppermill, 9
 3, ...	% Petroglyphs, 3
 3, ...	% RITTiger, 3
 5, ...	% RedwoodSunset, 5
 5, ...	% RoadsEndFireDamage, 5
 7, ...	% RoundBarnInside, 7
 3, ...	% RoundStoneBarn, 3
 3, ...	% Route66Museum, 3
 3, ...	% SequoiaRemains, 3
 5, ...	% SmokyTunnel, 5
 5, ...	% SouthBranchKingsRiver, 5
 3, ...	% SunsetPoint1, 3
 3, ...	% SunsetPoint2, 3
 3, ...	% TaughannockFalls, 3
 5, ...	% TheGrotto, 5
 3, ...	% TheNarrows1, 3
 5, ...	% TheNarrows2, 5
 5, ...	% TheNarrows3, 5
 3, ...	% TunnelView1, 3
 3, ...	% TunnelView2, 3
 3, ...	% TupperLake1, 3
 3, ...	% TupperLake2, 3
 3, ...	% URChapel1, 3
 5, ...	% URChapel2, 5
 3, ...	% UpheavalDome, 3
 5, ...	% WaffleHouse, 5
 5, ...	% WallDrug, 5
 3, ...	% WestBranchAusable1, 3
 3, ...	% WestBranchAusable2, 3
 3, ...	% WillyDesk, 3
 5, ...	% WillySentinel, 5
 3, ...	% YosemiteFalls, 3
 7];   	% Zentrum, 7

barakat = [ ...
 45.49589443,  46.69925129,  55.62306672,  55.85088885,  56.53059198, ...
 57.43821549,  58.05531677,  58.17616577,  58.83672358,  59.15271031, ...
 59.16169313,  59.80323405,  59.89349629,  60.00234355,  60.11725746, ...
 60.37934266,  60.57520146,  60.64370871,  60.75719511,  60.78735420, ...
 60.96947835,  61.02080292,  61.05630234,  61.17302504,  61.66715828, ...
 61.68372707,  61.75941458,  61.84243866,  61.97270440,  62.18133609, ...
 62.45200797,  62.57052528,  62.57894268,  62.68004740,  62.84874961, ...
 62.89921446,  63.09804051,  63.10348360,  63.16011860,  63.30428331, ...
 63.30528434,  63.37386387,  63.40969122,  63.42267633,  63.47868054, ...
 63.72097878,  63.84019643,  64.09710007,  64.26800346,  64.32537623, ...
 64.41610840,  64.41875548,  64.43477991,  64.72276504,  64.80943768, ...
 64.86764504,  64.91443212,  65.11487235,  65.18022322,  65.19918496, ...
 65.27591746,  65.44668641,  65.53654057,  65.61203840,  65.66962862, ...
 65.82889788,  66.01613023,  66.38623190,  66.55463376,  66.82672348, ...
 67.04875452,  67.20538376,  67.30354744,  67.55275786,  67.59385370, ...
 67.77115383,  68.29369909,  68.31034767,  68.53653367,  68.67435097, ...
 68.89155753,  69.05738937,  69.26121354,  69.39247772,  69.54722780, ...
 69.71267580,  69.81105445,  69.90442731,  70.96107790,  71.04787313, ...
 71.45208894,  71.65018770,  72.08295295,  72.26680445,  72.85637004, ...
 72.86091359,  73.25182816,  73.30596243,  73.47217900,  73.71631140, ...
 75.11524879,  76.22971690,  76.40041630,  76.57538405,  78.46421311];

hasinoff = [ ...
 47.16610044,  47.66335844,  48.43225587,  48.71508720,  49.88671142, ...
 54.11059599,  54.88175225,  55.35540510,  55.44958589,  56.39497702, ...
 56.79994068,  57.68201416,  57.86459814,  58.09506814,  58.42640024, ...
 58.55955803,  58.67256447,  58.68142157,  58.73283654,  58.74093214, ...
 58.98692569,  59.01890201,  59.16288009,  59.20680213,  59.35960296, ...
 59.37546869,  59.39611931,  59.71166113,  59.80142923,  59.81237210, ...
 59.85487417,  59.93097384,  59.98125487,  60.03202306,  60.10259498, ...
 60.13036846,  60.13551151,  60.18125068,  60.35048138,  60.40424472, ...
 60.44199447,  60.51535814,  60.61748884,  60.71905945,  60.76766701, ...
 60.77181488,  60.79499751,  60.87323234,  60.96570470,  61.00256391, ...
 61.09614250,  61.31647332,  61.51186710,  61.54236521,  61.69810394, ...
 62.01550291,  62.13545760,  62.47398227,  62.63415884,  62.87307734, ...
 62.90129492,  62.98180788,  63.00589647,  63.21094075,  63.37592106, ...
 63.49176923,  63.49592719,  63.60925376,  63.72610492,  64.06368273, ...
 64.15019241,  64.18274413,  64.35783460,  64.37304937,  64.65685204, ...
 64.86017745,  65.14317125,  65.53495108,  65.69599893,  65.85747452, ...
 65.97507500,  66.42963782,  66.46087157,  67.09423348,  67.18744675, ...
 67.22712297,  67.38416892,  67.43088582,  67.67719074,  67.72990804, ...
 68.58688629,  68.70650571,  69.53000525,  69.90336919,  69.90897968, ...
 70.16777659,  70.36563731,  71.32590852,  71.34184545,  71.46981629, ...
 73.39550063,  73.80514281,  75.75344052,  75.93440436,  76.41586307];

keht = [ ...
 47.50322670,  52.36803325,  52.49993230,  53.89682520,  55.90831946, ...
 55.98311108,  57.17646839,  58.15402259,  59.29591853,  59.34190391, ...
 59.70365698,  59.74777840,  60.19035056,  60.27812526,  60.33064131, ...
 60.62561294,  60.81958280,  60.82573295,  60.92708388,  61.35967125, ...
 61.37962511,  61.69540972,  61.79671015,  61.88681271,  62.13379141, ...
 62.30192165,  62.42614579,  62.60101367,  62.65408565,  62.68599787, ...
 62.72049712,  62.82615242,  62.89010494,  62.99528490,  63.00505031, ...
 63.17329919,  63.34122902,  63.54649661,  63.70336751,  63.78929362, ...
 63.87975504,  63.91337607,  64.24816346,  64.30235297,  64.35779394, ...
 64.64814881,  64.86271726,  64.91919349,  65.04791249,  65.10189660, ...
 65.20078922,  65.21031869,  65.44398406,  65.45354181,  65.60731863, ...
 65.72447137,  65.72511619,  65.74988973,  65.76566861,  66.10202423, ...
 66.31090032,  66.32546420,  66.36309934,  66.38248048,  66.39798459, ...
 66.55306021,  66.63732907,  66.76079758,  66.87742819,  67.00642992, ...
 67.21640907,  67.32406815,  67.81673475,  68.21331528,  68.59672075, ...
 68.61420819,  68.74667907,  69.24477032,  69.61341786,  69.86995877, ...
 70.04396828,  70.31395151,  70.34537562,  70.67878321,  70.85636861, ...
 70.86424056,  70.88396410,  71.09583494,  71.42609822,  71.73752479, ...
 71.84513314,  72.07681600,  72.12127197,  72.37964460,  72.55624890, ...
 73.16805588,  73.48048314,  73.61464134,  74.38428812,  74.67247552, ...
 76.09225914,  77.05376995,  78.26193590,  79.39056719,  82.84316803];

middle3 = [ ...
 47.32601116,  51.26311804,  52.20943792,  52.93105885,  55.03171309, ...
 55.15084896,  55.64560463,  56.00243582,  56.17783254,  56.67232317, ...
 58.84895951,  59.33397142,  59.71854162,  59.82483650,  60.05295816, ...
 60.36082764,  60.56581994,  60.62734778,  60.70062414,  60.82666133, ...
 61.05553344,  61.19950506,  61.36049757,  61.38718613,  61.49037229, ...
 61.61287074,  62.07582395,  62.21412161,  62.25144035,  62.25541987, ...
 62.62059577,  63.56348298,  63.56976758,  63.59551202,  63.79680982, ...
 63.87837204,  63.87855916,  63.89732498,  63.91414295,  63.91775682, ...
 63.93830502,  64.16308399,  64.20475071,  64.20766438,  64.25256451, ...
 64.48962813,  64.52904215,  64.57963494,  64.64806498,  64.90227872, ...
 64.93827371,  65.03573809,  65.22764484,  65.30354479,  65.48226094, ...
 65.53901247,  65.75972000,  66.02304336,  66.09937919,  66.13794073, ...
 66.46907260,  66.55581860,  66.87872136,  67.00804044,  67.09557437, ...
 67.20030423,  67.40916991,  67.63225468,  68.20392985,  68.41656119, ...
 68.76570385,  68.78402543,  68.93346228,  69.05917926,  69.06408866, ...
 69.14240687,  69.14537889,  69.21420306,  69.55898228,  69.61663191, ...
 69.75018232,  70.10961677,  70.49071750,  70.50722654,  70.81463091, ...
 70.88510631,  71.03605989,  71.33768344,  71.49727748,  71.70231617, ...
 71.75482392,  71.99098063,  72.55924182,  73.14474781,  73.16805588, ...
 73.23894303,  73.81575506,  75.81375856,  77.24162997,  77.65291064, ...
 77.96253377,  79.52512154,  82.01866300,  83.43879480,  83.80534092];

middle5 = [ ...
 49.01806603,  56.41640019,  56.82388215,  57.79052046,  57.82011849, ...
 58.19664186,  58.83270239,  58.95641731,  59.96210731,  60.59266996, ...
 60.92718012,  60.96807297,  61.43447157,  61.62218548,  61.89060765, ...
 61.89318368,  62.00301088,  62.15544071,  62.34950367,  62.42428579, ...
 62.65368878,  62.82495535,  63.35955713,  63.55967827,  63.79634319, ...
 63.83033497,  63.92051392,  64.07834928,  64.58472088,  64.70212310, ...
 65.00544297,  65.10372055,  65.29020440,  65.34649833,  65.66702916, ...
 65.75593491,  65.81300693,  65.86685745,  65.89470009,  65.98187163, ...
 66.00831975,  66.03182631,  66.07859610,  66.16506712,  66.44839504, ...
 66.51512361,  66.63327221,  66.75221542,  67.05476216,  67.19294821, ...
 67.33698254,  67.55292531,  67.71510826,  67.89287471,  68.05823661, ...
 68.23494889,  68.41309117,  68.46764512,  68.54976314,  68.59473398, ...
 68.81495264,  68.87368711,  68.87756267,  68.91827486,  69.04058805, ...
 69.17712310,  69.33828025,  69.39929796,  69.55148476,  69.91627153, ...
 70.23853093,  70.40349215,  70.41600931,  71.26621779,  71.44744225, ...
 71.46158145,  71.51714094,  71.58833541,  71.62460939,  71.66918612, ...
 71.67244298,  71.74248368,  73.03888731,  73.13501169,  73.28100760, ...
 73.46428886,  73.46919200,  73.68297089,  74.41487046,  74.92784762, ...
 74.95566375,  75.08221652,  75.20367838,  76.57868184,  77.27881469, ...
 78.24113977,  78.31243361,  78.73489806,  80.53931184,  82.14797274, ...
 82.97496008,  83.78406829,  84.95476338,  85.07784519,  86.57869985];

middle7 = [ ...
 49.01806603,  56.82388215,  57.82011849,  58.94922713,  58.95641731, ...
 59.96210731,  60.44930953,  60.45098738,  60.51669426,  60.59266996, ...
 60.96807297,  61.62218548,  61.89318368,  62.15544071,  62.42428579, ...
 62.65368878,  63.27047257,  63.35955713,  63.79634319,  63.84103354, ...
 63.88341348,  64.24812018,  64.58472088,  64.70212310,  64.73844603, ...
 65.00544297,  65.10372055,  65.23347613,  65.34649833,  65.66702916, ...
 65.68578788,  65.75593491,  65.81300693,  65.86685745,  65.89470009, ...
 65.98187163,  66.03182631,  66.14158349,  66.16506712,  66.18006703, ...
 66.26713565,  66.51512361,  66.63327221,  67.05476216,  67.19294821, ...
 67.33698254,  67.55292531,  67.89287471,  68.05234181,  68.05823661, ...
 68.23494889,  68.41309117,  68.46764512,  68.54976314,  68.59473398, ...
 68.87756267,  68.91827486,  69.04058805,  69.23173118,  69.33828025, ...
 69.55148476,  69.84903297,  70.23853093,  70.40349215,  70.41600931, ...
 71.10140977,  71.14526517,  71.19574184,  71.26621779,  71.29076530, ...
 71.44744225,  71.46158145,  71.51714094,  71.66918612,  71.67244298, ...
 72.11174056,  72.17413362,  72.30269942,  72.47987412,  72.58818901, ...
 72.83002799,  73.01191061,  73.03888731,  73.13501169,  73.29138659, ...
 73.46919200,  73.68297089,  74.92784762,  74.95566375,  75.08221652, ...
 75.20367838,  75.57098609,  76.57868184,  77.27881469,  78.24113977, ...
 78.31243361,  78.73489806,  79.51118352,  80.53931184,  82.97496008, ...
 83.78406829,  84.95476338,  85.07784519,  86.57869985,  89.18887304];

middle9 = [ ...
 49.01806603,  56.82388215,  57.82011849,  58.94922713,  58.95641731, ...
 59.96210731,  60.44930953,  60.45098738,  60.51669426,  60.59266996, ...
 60.96807297,  61.62218548,  61.89318368,  62.15544071,  62.42428579, ...
 62.65368878,  63.35955713,  63.78834176,  63.79634319,  63.88341348, ...
 64.24812018,  64.58472088,  64.70212310,  64.96911817,  65.00544297, ...
 65.10372055,  65.34649833,  65.53106068,  65.66702916,  65.68578788, ...
 65.70554003,  65.75593491,  65.81300693,  65.86685745,  65.89470009, ...
 65.98187163,  66.03182631,  66.06120257,  66.16506712,  66.18006703, ...
 66.51512361,  66.63327221,  67.05476216,  67.19294821,  67.33698254, ...
 67.55292531,  67.89287471,  68.05234181,  68.05823661,  68.23494889, ...
 68.41309117,  68.46764512,  68.54976314,  68.59473398,  68.87756267, ...
 68.91827486,  69.04058805,  69.23173118,  69.33828025,  69.55148476, ...
 69.84903297,  70.23853093,  70.40349215,  70.41600931,  70.62160459, ...
 71.10140977,  71.14526517,  71.26621779,  71.29076530,  71.44744225, ...
 71.46158145,  71.50454690,  71.51714094,  71.66918612,  71.67244298, ...
 71.70161634,  72.11174056,  72.17413362,  72.47987412,  73.01191061, ...
 73.03888731,  73.13501169,  73.46919200,  73.68297089,  73.91910479, ...
 74.23678247,  74.92784762,  74.95566375,  75.08221652,  75.20367838, ...
 75.57098609,  76.57868184,  77.27881469,  78.24113977,  78.31243361, ...
 78.73489806,  79.09229465,  79.51118352,  80.53931184,  82.97496008, ...
 83.78406829,  84.95476338,  85.07784519,  86.57869985,  89.18887304];

middle3unsorted = [ ...
  67.00804044, 64.52904215, 55.64560463, 63.89732498, 62.62059577, ...
  69.14240687, 62.25541987, 66.55581860, 64.64806498, 67.40916991, ...
  55.03171309, 61.38718613, 71.03605989, 65.75972000, 62.25144035, ...
  69.55898228, 64.16308399, 63.79680982, 61.61287074, 71.75482392, ...
  77.96253377, 65.53901247, 71.70231617, 56.00243582, 69.14537889, ...
  65.48226094, 64.20766438, 63.56976758, 64.25256451, 64.57963494, ...
  67.63225468, 77.24162997, 66.87872136, 47.32601116, 65.22764484, ...
  59.33397142, 59.71854162, 70.88510631, 73.16805588, 73.23894303, ...
  68.41656119, 61.49037229, 55.15084896, 63.59551202, 63.56348298, ...
  71.33768344, 51.26311804, 60.56581994, 60.62734778, 62.07582395, ...
  72.55924182, 63.91775682, 61.36049757, 63.93830502, 65.03573809, ...
  65.30354479, 75.81375856, 69.21420306, 79.52512154, 64.48962813, ...
  60.36082764, 60.70062414, 69.06408866, 70.49071750, 60.05295816, ...
  70.10961677, 68.93346228, 69.61663191, 59.82483650, 52.93105885, ...
  66.02304336, 61.19950506, 61.05553344, 68.20392985, 64.90227872, ...
  71.99098063, 64.20475071, 70.81463091, 67.20030423, 73.81575506, ...
  77.65291064, 68.76570385, 63.91414295, 83.43879480, 83.80534092, ...
  82.01866300, 58.84895951, 63.87855916, 69.05917926, 63.87837204, ...
  60.82666133, 71.49727748, 66.09937919, 62.21412161, 68.78402543, ...
  56.17783254, 66.13794073, 67.09557437, 64.93827371, 69.75018232, ...
  66.46907260, 52.20943792, 56.67232317, 70.50722654, 73.14474781];

middle5unsorted = [ ...
  74.41487046, 66.44839504, 57.79052046, 71.67244298, 62.15544071, ...
  71.26621779, 62.34950367, 65.00544297, 67.19294821, 69.33828025, ...
  58.83270239, 63.35955713, 69.04058805, 66.16506712, 62.42428579, ...
  68.59473398, 67.55292531, 69.17712310, 66.75221542, 74.95566375, ...
  78.24113977, 67.05476216, 75.20367838, 80.53931184, 68.81495264, ...
  65.10372055, 64.70212310, 66.00831975, 56.82388215, 65.29020440, ...
  74.92784762, 78.73489806, 73.68297089, 60.96807297, 75.08221652, ...
  59.96210731, 62.00301088, 77.27881469, 69.55148476, 73.28100760, ...
  68.91827486, 61.89060765, 69.39929796, 64.07834928, 68.23494889, ...
  71.62460939, 56.41640019, 66.51512361, 63.83033497, 63.92051392, ...
  82.14797274, 73.03888731, 61.43447157, 65.81300693, 65.34649833, ...
  65.75593491, 61.89318368, 68.46764512, 86.57869985, 65.98187163, ...
  63.79634319, 65.86685745, 76.57868184, 83.78406829, 60.59266996, ...
  71.51714094, 68.87368711, 70.40349215, 68.05823661, 49.01806603, ...
  65.66702916, 61.62218548, 63.55967827, 68.41309117, 65.89470009, ...
  68.87756267, 66.07859610, 71.58833541, 70.41600931, 73.13501169, ...
  78.31243361, 68.54976314, 64.58472088, 85.07784519, 84.95476338, ...
  82.97496008, 58.95641731, 71.44744225, 73.46919200, 66.63327221, ...
  60.92718012, 71.74248368, 66.03182631, 62.65368878, 70.23853093, ...
  58.19664186, 67.71510826, 69.91627153, 67.89287471, 71.66918612, ...
  67.33698254, 62.82495535, 57.82011849, 71.46158145, 73.46428886];

middle7unsorted = [ ...
  72.17413362, 71.19574184, 60.45098738, 71.67244298, 62.15544071, ...
  71.26621779, 60.51669426, 65.00544297, 67.19294821, 69.33828025, ...
  58.94922713, 63.35955713, 69.04058805, 66.16506712, 62.42428579, ...
  68.59473398, 67.55292531, 71.10140977, 66.18006703, 74.95566375, ...
  78.24113977, 67.05476216, 75.20367838, 80.53931184, 69.23173118, ...
  65.10372055, 64.70212310, 66.14158349, 56.82388215, 65.23347613, ...
  74.92784762, 78.73489806, 73.68297089, 60.96807297, 75.08221652, ...
  59.96210731, 65.68578788, 77.27881469, 69.55148476, 73.01191061, ...
  68.91827486, 71.29076530, 72.47987412, 63.88341348, 68.23494889, ...
  72.58818901, 75.57098609, 66.51512361, 66.26713565, 71.14526517, ...
  89.18887304, 73.03888731, 63.84103354, 65.81300693, 65.34649833, ...
  65.75593491, 61.89318368, 68.46764512, 86.57869985, 65.98187163, ...
  63.79634319, 65.86685745, 76.57868184, 83.78406829, 60.59266996, ...
  71.51714094, 79.51118352, 70.40349215, 68.05823661, 49.01806603, ...
  65.66702916, 61.62218548, 64.73844603, 68.41309117, 65.89470009, ...
  68.87756267, 68.05234181, 72.11174056, 70.41600931, 73.13501169, ...
  78.31243361, 68.54976314, 64.58472088, 85.07784519, 84.95476338, ...
  82.97496008, 58.95641731, 71.44744225, 73.46919200, 66.63327221, ...
  60.44930953, 64.24812018, 66.03182631, 62.65368878, 70.23853093, ...
  63.27047257, 69.84903297, 72.30269942, 67.89287471, 71.66918612, ...
  67.33698254, 72.83002799, 57.82011849, 71.46158145, 73.29138659];

middle9unsorted = [ ...
  72.17413362, 79.09229465, 60.45098738, 71.67244298, 62.15544071, ...
  71.26621779, 60.51669426, 65.00544297, 67.19294821, 69.33828025, ...
  58.94922713, 63.35955713, 69.04058805, 66.16506712, 62.42428579, ...
  68.59473398, 67.55292531, 71.10140977, 66.18006703, 74.95566375, ...
  78.24113977, 67.05476216, 75.20367838, 80.53931184, 69.23173118, ...
  65.10372055, 64.70212310, 65.70554003, 56.82388215, 63.78834176, ...
  74.92784762, 78.73489806, 73.68297089, 60.96807297, 75.08221652, ...
  59.96210731, 65.68578788, 77.27881469, 69.55148476, 73.01191061, ...
  68.91827486, 71.29076530, 72.47987412, 63.88341348, 68.23494889, ...
  73.91910479, 75.57098609, 66.51512361, 70.62160459, 71.14526517, ...
  89.18887304, 73.03888731, 66.06120257, 65.81300693, 65.34649833, ...
  65.75593491, 61.89318368, 68.46764512, 86.57869985, 65.98187163, ...
  63.79634319, 65.86685745, 76.57868184, 83.78406829, 60.59266996, ...
  71.51714094, 79.51118352, 70.40349215, 68.05823661, 49.01806603, ...
  65.66702916, 61.62218548, 64.96911817, 68.41309117, 65.89470009, ...
  68.87756267, 68.05234181, 72.11174056, 70.41600931, 73.13501169, ...
  78.31243361, 68.54976314, 64.58472088, 85.07784519, 84.95476338, ...
  82.97496008, 58.95641731, 71.44744225, 73.46919200, 66.63327221, ...
  60.44930953, 64.24812018, 66.03182631, 62.65368878, 70.23853093, ...
  65.53106068, 69.84903297, 71.50454690, 67.89287471, 71.66918612, ...
  67.33698254, 74.23678247, 57.82011849, 71.46158145, 71.70161634];

sesh = [ ...
 46.74597524,  47.63034606,  48.42317906,  48.62000280,  49.56029817, ...
 50.81267429,  51.58622860,  51.81566010,  51.91915666,  52.26713261, ...
 52.70953339,  53.54888425,  54.44392522,  54.96380524,  55.01685103, ...
 55.21699407,  55.31725810,  55.56919526,  55.64446563,  55.71143432, ...
 55.92003377,  55.93571932,  56.09813626,  56.27590607,  56.66784915, ...
 56.72823184,  56.93441139,  57.30286855,  57.68868518,  57.71233326, ...
 57.79558924,  57.79842199,  57.90398956,  57.90916169,  58.00144605, ...
 58.00642195,  58.01874454,  58.09581776,  58.31341462,  58.33374570, ...
 58.42608982,  58.43397103,  58.75371045,  58.89013971,  58.91252620, ...
 59.03655848,  59.16157999,  59.38279510,  59.78173804,  59.87681155, ...
 59.92453621,  59.92809806,  59.95530781,  60.01168641,  60.02242247, ...
 60.06872116,  60.44285638,  60.66572610,  60.71802687,  61.08144060, ...
 61.13569106,  61.13899430,  61.16891162,  61.18556612,  61.22011226, ...
 61.24315941,  61.27480021,  61.36316009,  61.45788083,  61.50618207, ...
 61.62669527,  61.67976171,  61.75862075,  61.76524622,  62.10690928, ...
 62.30392593,  62.31610453,  62.40122599,  62.43900965,  62.54435587, ...
 62.74869541,  62.86866763,  62.98119540,  63.14667053,  63.46642978, ...
 63.47070043,  63.56682750,  63.68812884,  63.75237592,  64.34221464, ...
 64.35695220,  64.69457830,  64.99185390,  66.09443588,  66.19820321, ...
 66.53020131,  67.44814114,  69.23715714,  69.49725474,  70.52664038, ...
 71.45843610,  71.55880523,  71.79676181,  73.14251379,  73.58821915];

setCovering = [ ...
 48.47506737,  53.07929315,  58.50819285,  58.82271833,  58.93867296, ...
 59.15566047,  59.26163403,  59.95482912,  60.09818239,  60.39817030, ...
 60.56324606,  61.34836636,  61.58401979,  62.39831303,  62.42991841, ...
 62.54169396,  62.68648577,  63.04118471,  63.30403241,  63.34122902, ...
 63.40766469,  63.48275317,  63.59596306,  63.96888217,  64.12767461, ...
 64.24472125,  64.26592868,  64.35481039,  64.44200737,  64.51924428, ...
 64.52097033,  64.77408298,  64.89950362,  65.31936646,  65.33055493, ...
 65.75284213,  66.08456545,  66.35414506,  66.41000178,  66.47427008, ...
 66.53315064,  66.62446290,  66.78840573,  66.81647941,  66.84869764, ...
 66.88487082,  66.91963094,  67.10336324,  67.14781100,  67.18512140, ...
 67.38141743,  67.62148717,  67.96472714,  68.03685982,  68.18621235, ...
 68.20585163,  68.36528577,  68.46284346,  68.53991063,  68.71765855, ...
 68.87322452,  68.95676303,  68.98874755,  69.02798853,  69.05804425, ...
 69.14718127,  69.53544264,  69.65115280,  69.70093040,  69.92601650, ...
 70.13343898,  70.46589497,  70.55229177,  70.68853758,  71.03519750, ...
 71.04787313,  71.10216475,  71.34580418,  71.40760360,  71.42889015, ...
 71.52995605,  71.66470818,  71.71015057,  71.76314661,  72.21562408, ...
 72.55624890,  72.70460243,  72.79004545,  73.07437297,  73.28298253, ...
 73.43640544,  73.94166788,  74.45645545,  74.48646620,  76.02062469, ...
 76.69451123,  78.40297254,  78.99869646,  79.63494061,  80.65134772, ...
 81.72361743,  83.10197848,  91.34376847, 100.00000000, 100.00000000];

setCoveringUnsorted = [ ...
  73.07437297, 81.72361743, 63.30403241, 78.99869646, 62.39831303, ...
  71.71015057, 71.66470818, 66.84869764, 66.47427008, 66.78840573, ...
  58.50819285, 61.58401979, 69.70093040, 65.75284213, 62.54169396, ...
  66.91963094, 64.24472125, 66.53315064, 64.52097033, 71.04787313, ...
  73.43640544, 63.59596306, 71.52995605, 71.10216475, 67.14781100, ...
  66.35414506, 64.12767461,100.00000000, 62.68648577,100.00000000, ...
  70.68853758, 74.48646620, 65.33055493, 48.47506737, 69.02798853, ...
  58.82271833, 68.98874755, 74.45645545, 68.46284346, 83.10197848, ...
  71.03519750, 69.53544264, 66.41000178, 63.34122902, 72.79004545, ...
  80.65134772, 59.95482912, 67.62148717, 71.34580418, 63.48275317, ...
  79.63494061, 64.77408298, 63.40766469, 63.04118471, 64.89950362, ...
  62.42991841, 72.21562408, 68.20585163, 91.34376847, 64.51924428, ...
  60.39817030, 73.94166788, 70.46589497, 76.69451123, 59.15566047, ...
  69.92601650, 68.53991063, 72.70460243, 71.42889015, 53.07929315, ...
  67.38141743, 59.26163403, 71.76314661, 68.36528577, 64.44200737, ...
  68.95676303, 67.10336324, 71.40760360, 63.96888217, 70.13343898, ...
  72.55624890, 69.14718127, 66.62446290, 66.81647941, 69.05804425, ...
  76.02062469, 60.09818239, 66.88487082, 68.18621235, 65.31936646, ...
  60.56324606, 67.18512140, 64.35481039, 61.34836636, 68.03685982, ...
  58.93867296, 68.87322452, 73.28298253, 67.96472714, 70.55229177, ...
  69.65115280, 66.08456545, 64.26592868, 68.71765855, 78.40297254];


    best = [];
    for j = 1:105
        l = determinedByHand(j);
        if( l == 3 )
	    best = [best middle3unsorted(j)];
        elseif( l == 5 )
	    best = [best middle5unsorted(j)];
        elseif( l == 7 )
	    best = [best middle7unsorted(j)];
        elseif( l == 9 )
	    best = [best middle9unsorted(j)];
        else
	    fprintf( 'trouble: %d\n', l );
        end
    end

    figure;
    %plot(barakat,'Color','black');
    plot(setCovering,'Color','black');
    hold on;
    %plot(hasinoff,'Color','blue');
    %plot(keht,'Color','magenta');
    %plot(sesh,'Color','red');
    plot(middle3,'Color','green');
    plot(middle5,'Color','red','LineStyle','-');
    plot(sort(best),'Color','cyan');
    %plot(middle7,'Color','red','LineStyle','--');
    %plot(middle9,'Color','red','LineStyle',':');
    xlim([0,105]);
    %ylim([10^-8,10^4]);
    legend({...
	'Set covering', ...
	'Middle 3', ...
	'Middle 5', ...
	'By hand'}, ...
	'Location','northwest');
    xlabel('Benchmark');
    ylabel('Quality measure');

end

