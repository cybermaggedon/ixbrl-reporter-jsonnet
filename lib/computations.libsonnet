
{

    input:: function(comp)
	if std.isString(comp)
	then
	    [ comp ]
	else
	    $.inputs(comp),

    inputs:: function(comp)
	if std.objectHas(comp, "inputs")
	then
	    std.flattenArrays([ $.input(v) for v in comp.inputs ])
	else
	    if std.objectHas(comp, "input")
	    then
		std.flattenArrays([ $.input(comp.input) ])
	    else
		[],

    comp_deps:: function(comps)
        [
	    { id: comp.id, inputs: $.inputs(comp) }
	    for comp in comps
	],

    is_met:: function(a, b)
       std.setDiff(std.set(a), std.set(b)) == [],

    met:: function(comps, base)
       [
           v for v in comps
	   if self.is_met(v.inputs, base)
       ],

    not_met:: function(comps, base)
       [
           v for v in comps
	   if !self.is_met(v.inputs, base)
       ],

    divide::function(comps, base)

       local m = $.met(comps, base);
       local nm = $.not_met(comps, base);

       local new_base = base + [v.id for v in m];

       assert m != [] : "Dependency error A";

       if nm == []
       then
           m
       else
           m + self.divide(nm, new_base),

    dep_order_ids:: function(comps)
       local dep_map = $.comp_deps(comps);
       local ord_map = self.divide(dep_map, []);
       [v.id for v in ord_map],

    order:: function(comps)
       local map = { [v.id]: v for v in comps };
       local dep_order = self.dep_order_ids(comps);
       [ map[v] for v in dep_order ],

    update:: function(base, updates)

       local base_map = { [v.id]: v for v in base };
       local all_map = base_map + { [v.id]: v for v in updates };

       local base_ids = std.set([v.id for v in base]);
       local all_ids = std.setUnion(base_ids, std.set([v.id for v in updates]));

       local comb = [ all_map[id] for id in all_ids ];

       self.order(comb),

}

