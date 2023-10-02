
// Load the library for the specify report type
local l = import "lib/frs102.libsonnet";

// Utility libraries
local modify = import "lib/modify.libsonnet";
local computations = import "lib/computations.libsonnet";

// This block defines the report structure.  This structure describes an
// unaudited Micro-entity accounts filing.  You shouldn't need to change
// any of this
local elts = {

    // Type of report
    "element": "frs102",

    // Accounting standard
    "accounting_standards": "micro-entities",

    // Accounts status = no audit, no accountants report
    "accounts_status": "audit-exempt-no-accountants-report",

    // Abridged
    "accounts_type": "abridged-accounts",

    // Title of report
    "title": "Unaudited Micro-Entity Accounts",

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

		// Title page, logo resource identifier is 'logo'
		{
		    "element": "title-page",
		    "logo": "logo"
		},

		// Company information page
		{
		    "element": "company-info"
		},	    

		// Balance sheet
		{	    
		    "element": "balance-sheet-unaudited-micro",
		    "signature": "signature"
		},

		/*		
                // Profit and loss
		{	    
		    "element": "profit-and-loss"
		},

		// Cash flows report
		{	    
		    "element": "cash-flows"
		},
		*/

		// Notes page at end.  This uses an element defined in this
		// file.
		{
		    "element": "local-notes",
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

	// This adds a new element kind to the report, 'local-notes'
	// which is loaded from a local file
        components +: {
            "local-notes"(c)::
   	        local obj = import "local-notes.libsonnet";
	        obj.element(c),
        },

	// Over-ride the default accounts mapping.  Default accounts mapping
	// is in default-mapping.jsonnet, and mappings defined in the file
	// below over-ride those in the default-mapping.jsonnet file.
	// There are two elements: line_inputs maps lines to Gnucash accounts
	// and composite_inputs maps groups/sums to input computations.
	accounts +: import "mapping.jsonnet",

    },

    // Loads computation over-rides.
    local comp_updates = (import "comps.jsonnet")($),

    // Configure accounts from the report structure at the start of this
    // file
    accounts:: $.library.from_element_def(elts, self)
        .with_metadata(self.metadata)

        // Merge the standard computations with the over-rides we just loaded.
	.include_computations(comp_updates),

    // Resources, used to load image and signature files.
    resource(x):: {
    	"logo": import "logo.jsonnet",
	"signature": import "signature.jsonnet",
    }[x],

};

// Output the report configuration
accts.accounts

