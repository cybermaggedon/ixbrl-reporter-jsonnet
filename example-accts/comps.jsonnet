function(accts)
[

    // Define a new 'shipping' computation for shipping and import charges
    accts.library.line("shipping", "Shipping").in_year(),

    // Define a new 'entertainment' computation for client entertainment
    // which needs to be accounted for separately.
    accts.library.line("entertainment", "Entertainment").in_year(),

]

