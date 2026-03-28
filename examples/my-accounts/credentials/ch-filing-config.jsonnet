/*
contents of  'ch-pw.jsonnet'
{
    "authentication": "G4nd3lf",
    "company-authentication-code": "AB4F8J",
    "presenter-id": "E0123456789",
}
*/


/*
contents of 'ch-local-credentials.jsonnet'
{
    //"authentication": "password", // in the ch-pw.jsonnet file, (which should not be version controlled).
    "company-number": "01234556",
    "company-name": "WALTER FOILS NERD LIMITED",
    "email": "Tony.smither@gmail.com",
    "company-type": "EW",
    "contact-name": "Tony Smither",
    "contact-number": "07123456789",
    "made-up-date": "2026-03-13", // For initial test the made-up-date should all be today
    "date-signed": "2026-03-12",
    "date": "2026-03-12",
}
*/


local pw = import 'ch-pw.jsonnet';
local local_credentials = import 'ch-local-credentials.jsonnet';

local submission = 
{
    /************************************************************
     * The following are replaced by local customisations
     ************************************************************/
    "company-number": "01234556",
    "company-name": "WALTER FOILS NERD LIMITED",
    "company-type": "EW",
    "email": "Tony.smither@gmail.com",
    "contact-name": "Tony Smither",
    "contact-number": "07123456789",

    // dates needing updating annually
    "made-up-date": "2026-03-13", // For initial test the made-up-date should all be today
    "date-signed": "2026-03-12",
    "date": "2026-03-12",

    /************************************************************
     * The following are
     * in the passord file and should not version controlled
     ************************************************************/
    // in the ch-pw.jsonnet file, (which should not be version controlled).
    "authentication": "password", 
    // in the ch-pw.jsonnet file, (which should not be version controlled).
    "company-authentication-code": "AB4F8J",
    "presenter-id": "E0123456789",


    /************************************************************
     * The following are not for customisation
     ************************************************************/
    "test-flag": "0",
    "package-reference": "4047",
    "url": "https://xmlgw.companieshouse.gov.uk/v1-0/xmlgw/Gateway"
} + local_credentials + pw;


submission

