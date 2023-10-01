
// Load the library for the specify report type
local l = import "lib/uk-corptax.libsonnet";

// Utility libraries
local modify = import "lib/modify.libsonnet";
local computations = import "lib/computations.libsonnet";


// This block defines the report structure.  This structure describes an
// unaudited Micro-entity accounts filing.  You shouldn't need to change
// any of this
local elts = {

    // Type of report
    "element": "corptax",

    // Title of report
    "title": "Corporation Tax Statement",

    // Location of Gnucash accounts file
    "accounts_file":
    "example2.gnucash",

    // Module used to load accounts: gnucash or piecash
    "accounts_kind": "gnucash",

    // Report elements
    "elements": [
	{

	    // Composite: a container for multiple elements
	    "element": "composite",

	    // Identifier, used to locate the element for output by
	    // ixbrl-report on command line e.g.
	    // ixbrl-report input.json report ixbrl
	    "id": "report",

	    // Elements in composite
	    "elements": [

		// The first few pages contain references to CT600 data
		// listed with boxes.  None of this information is needed
		// in the report, but makes it easier for a human to review.
		// The final 2 elements *are* needed.
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

		// This is the DPL (detailed profit & loss)
		{
		    "element": "detailed-profit-and-loss"
		},
		
		// Corporation tax calculation
		{
		    "element": "tax-calculation"
		}
	    ]
	}
    ]
};

// Accounts object
local accts = {

    // Load metadata
    metadata: import "metadata.jsonnet",

    // This overrides the standard library object loaded at the start
    // with local customisation
    library:: l + {

	// Over-ride the default accounts mapping.  Default accounts mapping
	// is in default-mapping.jsonnet, and mappings defined in the file
	// below over-ride those in the default-mapping.jsonnet file.
	// There are two elements: line_inputs maps lines to Gnucash accounts
	// and composite_inputs maps groups/sums to input computations.
	accounts +: import "mapping.jsonnet",

    },
    
    // Configure accounts from the report structure at the start of this
    // file
    accounts:: $.library.from_element_def(elts, self)
        .with_metadata(self.metadata),

    // Loads computation over-rides.
    local comp_updates = (import "comps.jsonnet")($),

    // Merge the standard computations with the over-rides we just loaded.
    local comps = computations.update(
	$.accounts.report.computations,
	comp_updates
    ),

    // Update contexts.  Note code here makes no changes.
    local ctxts = modify($.accounts.report.taxonomy.contexts),
    // ...Make changes here...
    local mod_ctxts = ctxts.delete("previous-period"),

    // Update worksheets, makes no changes.
    local wsheets = modify($.accounts.report.worksheets),
    local mod_wsheets = wsheets,

    // Update metadata.  Note code here makes no changes.
    local metadata = modify($.accounts.report.taxonomy.metadata),
    local mod_metadata = metadata.delete("average-employees-previous"),

    // Update description tags.  This is a tag which is applied to
    // worksheet labels to connect the label to a item dimension.
    // This is used in DPL detailed analysis tags to connect the label
    // to the data.
    local mod_desc_tags = $.accounts.report.taxonomy["description-tags"] + {
	"pension-setup-charges": "dpl:DescriptionActivity",
	"pensions": "dpl:DescriptionActivity",
	"cloud": "dpl:DescriptionActivity",
	"telecoms": "dpl:DescriptionActivity",
	"shipping": "dpl:DescriptionActivity",
	"cryptocurrency-fees": "dpl:DescriptionActivity",
	"bank-interest": "dpl:DescriptionActivity",
	"bank-charges": "dpl:DescriptionActivity",
	"billed-expenses": "dpl:DescriptionActivity",
	"other-income": "dpl:DescriptionActivity",
	"travel": "dpl:DescriptionActivity",
	"billable-travel": "dpl:DescriptionActivity",
    },

    // Add custom iXBRL tags
    local mod_tags = $.accounts.report.taxonomy.tags + {
	"pension-setup-charges": "uk-core:PensionCostsDefinedContributionPlan",
	"cloud": "dpl:TelecommunicationsCosts",
	"shipping": "dpl:OtherOperationalAdministrationCosts",
	"adjustments-entertainment": "ct-comp:AdjustmentsEntertaining",
	"cryptocurrency-fees": "dpl:BankCharges",
	"bank-interest": "uk-core:InterestExpenseOnBankOverdraftsBankLoansSimilarBorrowings",
	"bank-charges": "dpl:BankCharges",
	"billed-expenses": "uk-core:TurnoverRevenue",
	"other-income": "uk-core:TurnoverRevenue",
	"billable-travel": "dpl:TravelSubsistenceCosts",
	"other-staff-costs": "dpl:OtherStaffCosts",
    },

    // Sign-reversal configuration for custom fields
    local mod_rev = $.accounts.report.taxonomy["sign-reversed"] + {
	"pension-setup-charges": true,
	"cloud": true,
	"shipping": true,
	"adjustments-entertainment": false,
	"cryptocurrency-fees": true,
	"bank-interest": true,
	"billable-travel": true,
	"other-staff-costs": true,
    },

    // Merge updates to computations and taxonomy to the report.
    tailored:: self.accounts + {
	
	report +: {
	    computations: comps,
	    worksheets: mod_wsheets.val,
	    taxonomy +: {
		contexts: mod_ctxts.val,
		metadata: mod_metadata.val,
		"description-tags": mod_desc_tags,
		tags: mod_tags,
		"sign-reversed": mod_rev
	    }
	}

    }
};

// Output the report configuration
accts.tailored

