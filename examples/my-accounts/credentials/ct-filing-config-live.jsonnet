/********************************************************************************
* WARNING
*
* This set of credentials is used for
* the legally binding live Corporation Tax submission
*
********************************************************************************/



// load the local Corporation Tax overrides
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
    "class": "HMRC-CT-CT600", // The following without -TIL becomes a live submission
    
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

