
local base = import "base.libsonnet";

base + {

    accounts(line):: base.accounts.mapping[line],

    inputs(id):: base.accounts.compound[id],

    components:: {

	frs102(c)::
	    $.config() +
	    {
		report +: {
		    "accounting-standards": "none",
		    "accounts-status": "none",
		    "accounts-type": "none",
		    "title": "none",
		    local comps = import "frs102/frc102-computations.jsonnet",
		    local ws = import "frs102/frc102-worksheets.jsonnet",
		    "computations": comps($),
		    "worksheets": ws,
		},

		with_accounting_standards(val):: self + {
		    report +: { "accounting-standards": val }
		},

		with_accounts_status(val):: self + {
		    report +: { "accounts-status": val }
		},

		with_accounts_type(val):: self + {
		    report +: { "accounts-type": val }
		},

		with_title(val):: self + {
		    report +: { "title": val }
		}

	    } +
	    $.taxonomy("frs102"),

	"title-page"(c)::
	    local obj = import "frs102/title-page.libsonnet";
	    obj.element(c),

	"company-info"(c)::
	    local obj = import "frs102/company-info.libsonnet";
	    obj.element(c),

	"micro-entity-report"(c)::
	    local obj = import "frs102/micro-entity-report.libsonnet";
	    obj.element(c),

	consent(c)::
	    local obj = import "frs102/consent.libsonnet";
	    obj.element(c),

	"balance-sheet-unaudited-micro"(c)::
	    local obj = import "frs102/balance-sheet-unaudited-micro.libsonnet";
	    obj.element(c),

	"balance-sheet-audited-micro"(c)::
	    local obj = import "frs102/balance-sheet-audited-micro.libsonnet";
	    obj.element(c),

	composite(c)::
	    local obj = import "frs102/composite.libsonnet";
	    obj.element(c),

	"simple-notes"(c)::
	    local obj = import "frs102/simple-notes.libsonnet";
	    obj.element(c),

	"revision-info"(c)::
	    local obj = import "frs102/revision-info.libsonnet";
	    obj.element(c),

	"directors-report"(c)::
	    local obj = import "frs102/directors-report.libsonnet";
	    obj.element(c),

	"auditors-report"(c)::
	    local obj = import "frs102/auditors-report.libsonnet";
	    obj.element(c),

	"accountants-report"(c)::
	    local obj = import "frs102/accountants-report.libsonnet";
	    obj.element(c),

	"balance-sheet"(c)::
	    local obj = import "frs102/balance-sheet.libsonnet";
	    obj.element(c),

	"profit-and-loss"(c)::
	    local obj = import "frs102/profit-and-loss.libsonnet";
	    obj.element(c),

	"cash-flows"(c)::
	    local obj = import "frs102/cash-flows.libsonnet";
	    obj.element(c),

	"comprehensive-income"(c)::
	    local obj = import "frs102/comprehensive-income.libsonnet";
	    obj.element(c),

	notes(c)::
	    local obj = import "frs102/notes.libsonnet";
	    obj.element(c),

    },

    taxonomy(t):: {
	report +: {
	    taxonomy: {
		"frs102": import "taxonomy/frs102.jsonnet"
	    }[t]
	}
    },

}

