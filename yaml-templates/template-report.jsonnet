
local l = import "lib/uk-corptax.libsonnet";
local modify = import "lib/modify.libsonnet";
local computations = import "lib/computations.libsonnet";

local elts = {
    "element": "composite",
    "id": "report",
    "elements": [
	{
	    "element": "front-page"
	},
	{
	    "element": "capital-allowances"
	},
	{
	    "element": "profits"
	},
	{
	    "element": "losses"
	},
	{
	    "element": "tax-chargeable"
	},
	{
	    "element": "research-dev-enhanced-expenditure"
	},
	{
	    "element": "research-dev"
	},
	{
	    "element": "detailed-profit-and-loss"
	},
	{
	    "element": "tax-calculation"
	}
    ]
};

local cfg = {
};

local r = {

    local base_comps = import "lib/uk-corptax/ct-computations.jsonnet",
    local comp_updates = import "example-ct/comps.jsonnet",
    local comps = computations.update(base_comps, comp_updates),

    local base_wsheets = import "lib/uk-corptax/ct-worksheets.jsonnet",
    local wsheets = modify(base_wsheets).replace("rnd", {
	"id": "rnd",
	"kind": "simple",
	"description": "SME R&D",
	"computations": [
	    "rnd-proj1-enhanced-expenditure",
	    "rnd-enhanced-expenditure"
	]
    }).val,

    taxonomy: "//import ct-dpl.yaml",
    style: "//import style.yaml",
    title: "Corporation tax filing",
    computations: comps,
    worksheets: wsheets,
    elements: [l.from_element_def(elts, cfg)],

};

r

