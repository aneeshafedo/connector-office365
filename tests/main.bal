import ballerina/test;
import ballerina/log;

configurable string accessToken =?;

OfficeConfig config = {
    clientConfig: {
        token : accessToken
    }
};

Client baseClient = check new(config);

@test:Config {}
function testGetMyProfile() {
    log:printInfo("client->getMyProfile()");
    var resp = baseClient->getMyProfile();
    
}

