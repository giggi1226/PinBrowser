# PinBrowser

Pin	Browser	allows	you	to	quickly	request	a	web	page	by	entering	a	pin	number.	
Develop	a	root	controller	and	content	controllers	that	will	allow	a	user	to:	
1.	Enter	a	four	digit	pin	which	will	activate	a	Web	View	that	displays	an	associated	web	
page.		
2.	Create	a	UITabBarController	which	associates	a	unique	button	for	each	view:		Pin	
Entry	View,	Browser	View,	and	Edit	View.	Use	the	button	names:	Pin,	Browser,	Edit.	
User	can	switch	views	at	any	time	using	these	buttons.		
3.	Pin	Entry	View	accepts	a	four	digit	pin	from	0-9	using.	If	the	user	enters	the	wrong	
pin	an	Alert	View	appears	to	inform	the	user	to	try	again.	When	the	user	enters	a	
correct	pin,	the	Browser	View	displays	the	associated	web	page.	Display	the	pin	in	four	
UILabels	as	the	user	enters	the	number.	After	an	error	occurs	or	the	user	enters	the	
pin	correctly	the	last	pin	entered	is	cleared.	
4.	Browser	View	displays	the	url	associated	with	the	entered	pin	in	a	
UIWebView.	Display	the	Pin	entered	and	URL	of	the	page	at	the	top	of	the	
view.	
5.	Edit	View	allows	the	user	to	enter	a	new	pin/url	association	or	overwrite	an	
existing	one.	Edit	View	displays	a	list	of	up	to	10	pins	and	associated	URLs	that	
are	stored	in	a	NSMutableDic,onary.	You	can	initialize	three	pins	and	urls	(to	
any	values	you	like)	to	start.		
6.	You	must	create	a	Model	class	called	PinDatabase	which	will	store	the	Pin	
to	URL	assignments.	Develop	the	methods	necessary	to	update	the	model	
and	provide	the	content	to	update	the	views.	
