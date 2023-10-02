
// This file defines a mapping between computations and the inputs to those
// computations.

// This can be used to over-ride the default computations or to add new
// computations.  This file only defines the inputs to computations, for the
// actual computations themselves see comps.jsonnet.

// To add a new computation define it in comps.jsonnet, and declare its
// inputs in this file.

{

    // Defines the mapping between 'line' computations and GnuCash accounts.
    // The entries here should be GnuCash account names.
    line_inputs +: {

	// Add the input to the 'entertainment' computation
	entertainment: [
	    "Expenses:Entertainment",
	],

	// Add the input to the 'shipping' computation
	shipping: [
	    "Expenses:VAT Purchases:Import Charges",
	    "Expenses:VAT Purchases:Shipping Charges"
	],

    },

    // Defines the mapping between 'sum/group' computations and other
    // computations.  The entries here should be computation names.
    // Note that group/sum computations take an array of computation names,
    // whereas factor/round take a single computation name, which should not
    // be an array.
    compound_inputs +: {

	// This changes the 'other-charges' computation so that it includes
	// entertainment and shipping.
	"other-charges": [
	    "accountancy",
	    "bank-charges",
	    "office",
	    "software",
	    "subscriptions",
	    "sundries",
	    "telecoms",
	    "travel",
	    "entertainment",
	    "shipping",
	]

    },

}

