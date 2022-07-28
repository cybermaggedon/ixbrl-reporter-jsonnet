
function(val) {

    val: val,

    local obj = self,

    local repl = function(l, id, val)
        [if elt.id == id then val else elt for elt in l],

    local del = function(l, id)
        std.filter(function(elt) elt.id != id, l),

    local ins_aft = function(arr, aft_id, val)
        local ids = std.map(function(x) x.id, arr);
        local ixs = std.find(aft_id, ids);
        if std.length(ixs) < 1
        then arr
        else
    	    local pos = ixs[0] + 1;
            std.flattenArrays([arr[:pos], [val], arr[pos:]]),

    replace(id, val):: self + { val: repl(obj.val, id, val) },

    delete(id):: self + { val: del(obj.val, id) },

    insert_after(id, val):: self + { val: ins_aft(obj.val, id, val) }
}

