/*
contents of  'ct-pw.jsonnet'
{
	"password": "G4nd4lf",
}

*/


/*
contents of 'ct-local-credentials.jsonnet'
{
    "declaration-name": "Peter Thomas Jonas",
    "username": "123456789123", // is the Government Gateway user ID which looks like a 12 character identity": "EC8...",
    "title": "Mr",
    "first-name": "Peter",
    "second-name": "Jonas",
    "email": "pete.jonas@gmail.com",
    "phone": "447912344556",
}
*/


local pw = import 'ct-pw.jsonnet';
local local_credentials = import 'ct-local-credentials.jsonnet';

local submission = 
{
    /************************************************************
     * The following are replaced by local customisations
     ************************************************************/
    "declaration-name": "John Smith",
    "declaration-status": "Director", // assumed this is normally the case for a small company
    "password" : "TBA", // is the password associated with this login
    "username": "123456789123", // is the Government Gateway user ID which looks like a 12 character identity": "EC8...",
    "title": "Mr",
    "first-name": "John",
    "second-name": "Smith",
    "email": "john1.smith2@gmail.com",
    "phone": "447912344556",
    "timestamp": "2026-02-05T00:00:00",


    /************************************************************
     * The following is set for live submission
     ************************************************************/
    "class": "HMRC-CT-CT600-TIL", // The following without -TIL becomes a live submission
    
    /************************************************************
     * The following are not for customisation
     ************************************************************/
    "gateway-test": "0", // should be 0
    "vendor-id": "1234",
    "software": "ct600",
    "software-version": "1.0.0",
    "url": "https://transaction-engine.tax.service.gov.uk/submission", // this is the transaction-engine, not test-transaction-engine
} + local_credentials + pw;


submission

