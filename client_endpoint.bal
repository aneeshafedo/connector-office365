import ballerina/http;
import ballerina/log;

public client class Client {
    http:Client officeClient;
    public function init(OfficeConfig config) returns error?{
        self.officeClient = check new (baseURL,
            {
                auth: config.clientConfig
            }
        );
    }

    //General REST API methods
    remote function getMyProfile() {
        var response = self.officeClient->get("/me");
        if response is http:Response {
            var payload = response.getJsonPayload();
            if payload is json {
                log:printInfo(payload.toString());
            } else {
                log:printError("Invalid Payload", 'error = payload);
            }
        } else {
            log:printError("Invalid response", 'error = response);
        }
    }

    remote function getMyMail() {
        var response = self.officeClient->get("/me/messages");
        if response is http:Response {
            var payload = response.getJsonPayload();
            if payload is json {
                log:printInfo(payload.toString());
            } else {
                log:printError("Invalid Payload", 'error = payload);
            }
        } else {
            log:printError("Invalid response", 'error = response);
        }
    }
}

public type OfficeConfig record {|
    http:BearerTokenConfig clientConfig;
|};