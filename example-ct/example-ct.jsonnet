
//
// This is a UK HMRC corptax statement with iXBRL.  This results in a single
// document containing corporation tax 'computations' plus a DPL (detailed
// profit and loss) statement.  For a corptax filing, that report would be
// included in a CT electronic filing.  The annual company accounts filing
// doesn't have enough detail and tagging to support the profit/loss
// reporting that HMRC want, hence the DPL taxonomy allows describing a
// profit/loss with the detail needed.
//
// Because DPL with detailed tagging is needed by HMRC, if you add
// extra computations to this configuration, it is really necessary to think
// about whether they should be tagged when they appear in reports.
//
// There are two main ways of changing computations which thinking about
// tagging:
// - Breaking down a computation.  Say, you might turn a single
//   computation into multiple parts, e.g. income becomes various income
//   lines which all add up to the whole income value.  Each of those parts
//   needs to have dimensions to explain how they add up to the whole.
//   This can be done by adding DetailedItem tags.
// - Adding a new computation for which no tag exists.  This requires
//   adding a tag and making sure something is picked which fits with the
//   taxonomy.
// 
// The corptax filing is nowhere near as well defined as a CH annual filing.
// Specifications are:
// - The CT600 form plus guidance.  This form is not used if you file
//   electronically, but the guidance explains what some boxes mean.
// - The CT service specification which describes the CT filing process
//   the 'Govtalk' header and the XML structure which makes up a CT filing.
// - The CT (computations) and DPL (detailed profit/loss) taxonomies which
//   describe the iXBRL which this report produces.  'Computations' means
//   working out how much corptax to pay, which means taking profits,
//   apply adjustments and rebates and splitting across financial years.
//   DPL means describing company profits calcuations by explaining
//   income and expenses in detail.  This report products CT and DPL in the
//   same report, but it may be possible to file them separately.
//   HMRC docs says that CT/DPL filing is required, but also not mandatory
//   implying you can make a CT filing without this report.  At the end of
//   the day, a corptax filing is about by being accountable to the
//   administrators and explaining your workings, so you don't get audited.
//   Makes sense to do a good job of the filing since it can be totally
//   automated.
//

// Load the library for the specify report type
local l = import "lib/uk-corptax.libsonnet";

// This block defines the report structure.  This structure describes a
// corporation tax report.  There isn't a standard for this, this is
// something we invented to capture the right information
// You shouldn't need to change any of this
local elts = {

    // Type of report
    "element": "corptax",

    // Title of report
    "title": "Corporation Tax Statement",

    // Location of Gnucash accounts file
    "accounts_file": "example2.gnucash",

    // Module used to load accounts: gnucash or piecash
    "accounts_kind": "piecash",

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
    
    // Loads computation over-rides.
    local comp_updates = (import "comps.jsonnet")($),

    // Configure accounts from the report structure at the start of this
    // file
    accounts:: $.library.from_element_def(elts, self)
        .with_metadata(self.metadata)

        // Merge the standard computations with the over-rides we just loaded.
	.include_computations(comp_updates)

        // Delete unused context
	.delete_context("previous-period")

        // Delete a metadata item
	.delete_metadata("average-employees-previous")

        // Update description tags.  This is a tag which is applied to
        // worksheet labels to connect the label to a item dimension.
        // This is used in DPL detailed analysis tags to connect the label
        // to the data.
	.include_description_tags({

	    // There isn't a DPL tag for shipping/imports so we put it
	    // in other operational admin costs, and label it
	    // with a detail label.  This causes ixbrl-report to tag the
	    // account label with this tag
	    "shipping": "dpl:DescriptionActivity",

	})

        // Add custom iXBRL tags
	.include_tags({
	    "shipping": "dpl:OtherOperationalAdministrationCosts",
	    "adjustments-entertainment": "ct-comp:AdjustmentsEntertaining",
	})

        // Sign-reversal configuration for custom fields
	.include_sign_reverse({
	    "shipping": true,
	}),

};

// Output the report configuration
accts.accounts

