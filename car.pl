% Store user answers to be able to track his progress
:-dynamic known/3.
:-discontiguous ask/2.
start:- notice,find,nl,write('Thanks! For using our system.').
notice:- write('This is a CAR RECOMMENDATION EXPERT SYSTEM.'),nl,nl,
write('Just answer the following questions as y or n.'),nl,nl,
write('Low range: Below 18 lacs'),nl,
write('Mid range: 19-38 lakhs'),nl,
write('High range: Above 38 lakhs'),nl,
retractall(known(_,_,_)).

find:- car(p,A),!,nl,write('The best recommended car for you is '),describe(A).
find:- nl,write('Sorry! We can not find a car according to your preferences.').

% Rules for the knowledge base
car(X,honda_fit):-
    budget(X,'low range'),
    mileage(X,'26-38 mpg'),
	why(X,transport),
	care_about(X,'being active/doing things').
	
car(X,chevy_ford):-
    budget(X,'low range'),
    mileage(X,'26-38 mpg'),
	why(X,'transportation purpose'),
	care_about(X,'the environment'),
	run(X,electricity).
	
car(X,vwjetta):-
    budget(X,'low range'),
    mileage(X,'26-38 mpg'),
	why(X,'transportation purpose'),
	care_about(X,'the environment'),
	run(X,diesel).

car(X,nissan_leaf):-
    budget(X,'mid range'),
    mileage(X,'39-50 mpg'),
	why(X,'transportation purpose'),
	care_about(X,'the environment'),
	run(X,batteries).	
	
car(X,bmw):-
    budget(X,'high range'),
    mileage(X,'26-38 mpg'),
	why(X,'transportation purpose'),
	category(X,'convertible roof opening').
	
car(X,ford_c_max):-
    budget(X,'low range'),
    mileage(X,'39-50 mpg'),
	why(X,'transportation purpose'),
	category(X,'convertible roof opening').

car(X,morgan):-
    budget(X,'mid range'),
    mileage(X,'26-38 mpg'),
	why(X,fun),
	fun_for_you(X,'being awesome').

car(X,porsche):-
    budget(X,'high range'),
    mileage(X,'26-38 mpg'),
	why(X,fun),
	fun_for_you(X,'going fast'),
	cylinder(X,'6'),
	engine(X,'behind the driver seat').
	
car(X,nissan_gt_r):-
    budget(X,'high range'),
    mileage(X,'13-25 mpg'),
	why(X,fun),
	fun_for_you(X,'going fast'),
	cylinder(X,'6'),
	engine(X,'in front of the car').
	
car(X,bmw_cadalic):-
    budget(X,'high range'),
    mileage(X,'13-25 mpg'),
	why(X,fun),
	fun_for_you(X,'going fast'),
	cylinder(X,'6'),
	engine(X,'at rear end of the car').

car(X,ferrari_mc):-
    budget(X,'high range'),
    mileage(X,'13-25 mpg'),
	why(X,fun),
	fun_for_you(X,'going fast'),
	cylinder(X,'8'),
	with_people(X,'1-2 persons').

car(X,bmw_mer_porsche):-
    budget(X,'high range'),
    mileage(X,'13-25 mpg'),
	why(X,fun),
	fun_for_you(X,'going fast'),
	cylinder(X,'8'),
	with_people(X,'3-4 persons').

car(X,cadillac_cts):-
    budget(X,'high range'),
    mileage(X,'26-38 mpg'),
	why(X,fun),
	fun_for_you(X,'going fast'),
	cylinder(X,'8'),
	with_people(X,'more than 4 persons').

car(X,srt):-
    budget(X,'high range'),
    mileage(X,'13-25 mpg'),
	why(X,fun),
	fun_for_you(X,'going fast'),
	cylinder(X,'12').

car(X,scion):-
    budget(X,'mid range'),
    mileage(X,'13-25 mpg'),
	why(X,fun),
	fun_for_you(X,'carving curves').

% Questions for the knowledge base
budget(_An,Val):-ask('Do you require within ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write( Val),write('? (y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.

mileage(_An,Val):-ask('Do you require car within mileage range of ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write( Val),write('? (y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.

why(_An,Val):-ask('Do you want to buy car for ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write( Val),write('? (y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.

care_about(_An,Val):-ask('Do you care about ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write(Val),write('? (y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.

run(_An,Val):-ask('Do you require your car to run on ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write( Val),write('? (y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.

category(_An,Val):-ask('Do you like cars with ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write( Val),write('? (y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.

fun_for_you(_An,Val):-ask('According to you fun is ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write( Val),write('? (y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.

cylinder(_An,Val):-ask('Number of cylinders you require is ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write( Val),write('? (y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.

with_people(_An,Val):-ask('Do you require seating capacity of ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write( Val),write('?(y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.

engine(_An,Val):-ask('Do you want your engine to be installed ',Val).
ask(Obj,Val):-known(Obj,Val,y),!.
ask(Obj,Val):-known(Obj,Val,n),!,fail.
ask(Obj,Val):-nl,write(Obj),write( Val),write('? (y/n)'),read(Ans),asserta(known(Obj,Val,Ans)),Ans==y.


% Car descriptions for the knowledge base
describe(honda_fit) :-
	write('HONDA FIT'),nl,
	write('A flexible interior, an efficient powertrain, and agreeable pricing make the Fit an easy recommendation. Its firm ride makes it fun to drive, while light steering makes it great for in-town driving—icing on the cake. The handy multiconfigurable interior offers more cargo room than the Fit\'s size implies, too. The 130-hp 1.5-liter engine drives the front wheels through a six-speed manual or a CVT. Uplevel EX and EX-L models get a 7.0-inch touchscreen infotainment system; navigation is optional.'),nl.

describe(chevy_ford):-
	write('CHEVY FORD'),nl,
	write('The weight-loss program and high-tech wizardry under the hood pay off with an impressive 17 mpg overall fuel economy from the 2.7-liter turbo V6—edging out the 5.3-liter V8 Chevrolet Silverado by one hay-hauling mpg. (The Ram 1500 diesel still leads the class with 20 mpg overall.) The F-150\'s 2.7- and beefier 3.5-liter turbo-V6 engines provide plenty of punch even at low revs, with quick acceleration and effortless towing ability.'),nl.

describe(vwjetta):-
	write('VW JETTA SPORTWAGEN TDI'),nl,
	write('Mix the goodness of the Golf with the utility of a wagon, and you get the Golf SportWagen—as well as a 10Best award. The standard engine is a 170-hp 1.8-liter turbocharged four-cylinder with front-wheel drive and a five-speed manual transmission; a six-speed automatic and all-wheel drive are optional. The ride is solid and controlled, interior quality is very good, and the front seats are highly supportive. A standard touchscreen infotainment system features Apple CarPlay and Android Auto.'),nl.

describe(nissan_leaf):-
	write('NISSAN LEAF'),nl,
	write('Nissan Leaf Review. The Nissan Leaf is easy, fun and comfortable to drive. Just make sure you can live with the limited range. The Nissan Leaf is an all-electric family hatchback that\'s roughly the same size as a Vauxhall Astra.'),nl.

describe(bmw):-
	write('BMW X1'),nl,
	write('The X1 is available with a turbocharged 2.0-litre petrol engine and a range of 2.0-litre diesels, plus buyers can choose between front and four-wheel drive.').		

describe(ford_c_max):-
	write('FORD C-MAX'),nl,
	write('While comfortable and fun to drive, the C-Max’s high EPA-estimated fuel-economy numbers are basically fantasy. A 2.0-liter four and electric motors in the CVT combine for 188 hp; in our testing, the C-Max and the plug-in C-Max Energi got only 32 and 33 mpg, respectively. If a hybrid can\'t top a gas-powered opponent’s fuel economy, then why bother? The Energi\'s EV-only range of 19 miles is inadequate, too. That the C-Max drives much like a conventional hatchback only furthers that point.').

describe(morgan):-
	write('MORGAN 3-WHEELER'),nl,
	write('Just as Larsen intended with the Ace, the 3 Wheeler\'s layout is much like the original Twenties Morgans, with a tubular steel spaceframe using independent front suspension, with a large-capacity V-twin engine across the body. Morgan selected an S&S unit after Harley-Davidson mysteriously pulled out. The S&S X-Wedge is a two-valve, fuel-injected, dry-sump engine, with 56.25 degrees between the cylinders for cooling purposes. It displaces 1,982cc and punches out almost 80bhp and 100lb ft of torque, with peak revs at 5,200rpm.'),nl.

describe(porsche):-
	write('PORSCHE 911'),nl,
	write('The 911 debuted in the 1960s and remains at the pinnacle of automobiledom while staying true to its roots as the quintessential sports car. An eager rear-mounted 370-hp, 3.0-liter twin-turbo flat-six powers the rear wheels; S models make 420 hp. A seven-speed manual transmission is standard; all-wheel drive and a seven-speed dual-clutch automatic are options. In coupe, convertible, and Targa form, the 911 is as luxurious as it is sure-footed, making even novices feel like racing legends.'),nl.	
	
describe(nissan_gt_r):-
	write('NISSAN GT-R'),nl,
	write('Doesn\'t matter what you call it—GT-R or, more fittingly, Godzilla—Nissan\'s range topper is a supercar-stomping, high-tech dynamo. Its 3.8-liter twin-turbo V-6 makes a mighty 565 hp while a six-speed dual-clutch automatic and all-wheel drive team up to put all that power to the pavement. The GT-R\'s quick steering, rigid structure and adjustable suspension can make even amateurs feel positively heroic from behind the wheel. Want more? Check out the track-ready NISMO-tuned variant with 600 hp.'),nl.
	
describe(bmw_cadalic):-
	write('BMW 335i'),nl,
	write('BMW’s superb 3.0-liter turbo straight-six churns up a manly helping of torque that peaks just north of idle, and max horsepower comes on at 5800 rpm. The six emits seductively determined noises when pressed, particularly in Sport mode, and the only way to induce any lagging or lugging is to engage a high gear at low rpm.'),nl.

describe(ferrari_mc):-
	write('FERRARI 458'),nl,
	write('As instruments of pure speed, few cars can touch the 458 Italia and its convertible counterpart, the 458 Spider. Powered by a 562-hp V-8 mated to a seven-speed dual-clutch transmission and riding on an F1-inspired suspension, the mid-engined 458 is as pure a sports car as anything on the road. It looks the part, too, with X-Acto knife styling and an intense, if overwrought, interior. Need to turn up the exclusivity? You\'ll want the 458 Speciale or the 458 Speciale A, with 597 hp.'),nl.

describe(bmw_mer_porsche):-
	write('BMW M5'),nl,
	write('The Good The 2016 BMW M5 is extremely customizable, putting multiple drive, suspension, steering, and transmission modes at the driver\'s fingertips. The 4.4-liter twin-scroll, twin-turbocharged engine boasts 575 horsepower when equipped with the Competition package.'),nl.

describe(cadillac_cts):-
	write('CADILLAC CTS-V WAGON'),nl,
	write('Now this is our kind of Cadillac: It\'s got a supercharged 640-hp 6.2-liter V-8, big Brembo brakes, an eight-speed automatic, and rear-wheel drive. A manual is not offered, but you won\'t care when this brute hits 60 mph in 3.6 seconds and 100 mph just 3.9 seconds later. The steering is accurate yet hefty, while the ride is surprisingly civilized thanks to a magnetorheological suspension. Cadillac claims a top speed of 200 mph and we won\'t argue. This is a supersedan in every sense.'),nl.

describe(srt):-
	write('SRT VIPER'),nl,
	write('The Viper is both all-American and a true exotic, with lots of curves and bulges in all the right places to let you know it means business. The long nose, bodacious body, and predatory stare give the Viper a menacing look, while its 645-hp, 8.4-liter V-10 can catapult it to 60 mph in about three seconds. For the ultimate track monster, check out the Viper ACR. With all kinds of aero aids, special tires by Kumho and carbon-ceramic brakes, Dodge says it is the fastest Viper on a racetrack.'),nl.

describe(scion):-
	write('SCION FR-S/SUBARU BRZ'),nl,
	write('Offering sports-car agility on a budget, the FR-S features excellent driving dynamics for a manageable price. Only one engine is offered-a 200-hp 2.0-liter flat-four-with a six-speed manual or six-speed automatic. The manual shifts with a solid, no-nonsense feel, while the paddle-shift automatic is quick and responsive. The cabin is cramped and plasticky, but the FR-S is very agile, which endears it to enthusiasts. Scion\'s demise moves the FR-S to the Toyota showroom for 2017 under the name 86.'),nl.