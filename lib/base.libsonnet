{

    config():: {

	local cfg = self,

	style:: import "style.jsonnet",

	report +: {
	    "style": cfg.style
	},

	with_accounts_file(file):: self + {
	    accounts +: {
		file: file
	    }
	},

	with_accounts_kind(kind):: self + {
	    accounts +: {
		kind: kind
	    }
	},

	with_metadata(m):: self + { metadata: m },

	with_elements(e):: self + { report +: { elements: e } },

	include_computations(updates)::
            local clib = import "lib/computations.libsonnet";
	    local comps = clib.update(
                self.report.computations,
                updates
	    );
	    self + {
		report +: {
		    computations: comps
		}
	    },

	delete_worksheet(id)::
	    local modify = import "lib/modify.libsonnet";
	    local ws = modify(self.report.taxonomy.worksheets)
	        .delete(id);
	    self + {
		report +: {
		    worksheets: ws
		}
	    },

	replace_worksheet(id, val)::
	    local modify = import "lib/modify.libsonnet";
	    local ws = modify(self.report.taxonomy.worksheets)
	        .replace(id, val).val;
	    self + {
		report +: {
		    worksheets: ws
		}
	    },

	insert_worksheet(id, val)::
	    local modify = import "lib/modify.libsonnet";
	    local ws = modify(self.report.taxonomy.worksheets)
	        .insert_after(id, val).val;
	    self + {
		report +: {
		    worksheets: ws
		}
	    },

	delete_context(id)::
	    local modify = import "lib/modify.libsonnet";
	    local cs = modify(self.report.taxonomy.contexts)
  	        .delete(id).val;
	    self + {
		report +: {
		    taxonomy +: {
			contexts: cs
		    }
		}
	    },

	replace_context(id, val)::
	    local modify = import "lib/modify.libsonnet";
	    local cs = modify(self.report.taxonomy.contexts)
	        .replace(id, val).val;
	    self + {
		report +: {
		    taxonomy +: {
			contexts: cs
		    }
		}
	    },

	insert_context(id, val)::
	    local modify = import "lib/modify.libsonnet";
	    local cs = modify(self.report.taxonomy.contexts)
	        .insert_after(id, val).val;
	    self + {
		report +: {
		    taxonomy +: {
			contexts: cs
		    }
		}
	    },

	delete_metadata(id)::
	    local modify = import "lib/modify.libsonnet";
	    local cs = modify(self.report.taxonomy.metadata)
  	        .delete(id).val;
	    self + {
		report +: {
		    taxonomy +: {
			metadatas: cs
		    }
		}
	    },

	replace_metadata(id, val)::
	    local modify = import "lib/modify.libsonnet";
	    local cs = modify(self.report.taxonomy.metadata)
	        .replace(id, val).val;
	    self + {
		report +: {
		    taxonomy +: {
			metadatas: cs
		    }
		}
	    },

	insert_metadata(id, val)::
	    local modify = import "lib/modify.libsonnet";
	    local cs = modify(self.report.taxonomy.metadata)
	        .insert_after(id, val).val;
	    self + {
		report +: {
		    taxonomy +: {
			metadatas: cs
		    }
		}
	    },

	include_description_tags(tags)::
 	    local new_tags = self.report.taxonomy["description-tags"] + tags;
	    self + {
		report +: {
		    taxonomy +: {
			"description-tags": new_tags
		    }
		}
	    },

	include_tags(tags)::
 	    local new_tags = self.report.taxonomy.tags + tags;
	    self + {
		report +: {
		    taxonomy +: {
			tags: new_tags
		    }
		}
	    },

	include_sign_reverse(upd)::
 	    local new_sr = self.report.taxonomy["sign-reversed"] + upd;
	    self + {
		report +: {
		    taxonomy +: {
			"sign-reversed": new_sr
		    }
		}
	    },

    },

    from_element_def(eltdef, c)::

        local elt = self.components[eltdef.element](c);

	local with = function(obj, k)
	  if k == "element"
	  then obj
	  else
	      (if k == "elements"
	      then obj + obj.with_elements([
                  $.from_element_def(e, c) for e in eltdef["elements"]
              ])
	      else obj["with_" + k](eltdef[k]));

	local mod_elt = std.foldl(
	    with, std.objectFields(eltdef), elt
	);

        mod_elt,

    accounts:: {

	local accounts_mapping = import "default-mapping.jsonnet",

	line_inputs:: accounts_mapping.line_inputs,

	compound_inputs:: accounts_mapping.compound_inputs,

    },

    computation(id, description):: {
        id: id,
	description: description,
	in_year():: self + { period: "in-year" },
	at_end():: self + { period: "at-end" },
	at_start():: self + { period: "at-start" },
	note(n):: self + { note: n },
	segment(k, v)::
	    local elt = { [k]: v };
  	    if std.objectHas(self, "segments") then
	        local segs = self.segments + [{ [k]: v }];
		self + { segments: segs }
	    else
	        self + { segments: [ { [k]: v } ] },
	reverse_sign():: self + { "reverse-sign": true },

    },

    line(id, description):: $.computation(id, description) + {
        kind: "line",
        accounts: $.line_inputs(id),
    },

    sum(id, description):: $.computation(id, description) + {
        kind: "sum",
        inputs: $.compound_inputs(self.id),
    },

    group(id, description):: $.computation(id, description) + {
        kind: "group",
        inputs: $.compound_inputs(self.id),
    },

    round(id, description):: $.computation(id, description) + {
	kind: "round",
	down():: self + { direction: "down" },
	up():: self + { direction: "up" },
	nearest():: self + { direction: "nearest" },
        input: $.compound_inputs(self.id),
    },

    factor(id, description):: $.computation(id, description) + {
	kind: "factor",
	with_factor(f):: self + { factor: f },
        input: $.compound_inputs(self.id),
    },

    compare(id, description):: $.computation(id, description) + {
	kind: "compare",
	greater():: self + { comparison: "greater" },
	less():: self + { comparison: "less" },
        input: $.compound_inputs(self.id),
    },

    apportion(id, description):: $.computation(id, description) + {
	kind: "apportion",
	whole_period(p):: self + { "whole-period": p },
	proportion_period(p):: self + { "proportion-period": p },
        input: $.compound_inputs(self.id),
    },

    line_inputs(line):: $.accounts.line_inputs[line],

    compound_inputs(id):: $.accounts.compound_inputs[id],

}

