# <b>UserModeration Api v1</b>

## /v1/not-approved/reactivate
```json
{
    "Method": "POST",
    "Description": "Post the acceptance of terms of service of an authenticated but moderated user.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "501": {
            "description": "API is not implemented.\r\n1: Page is not available or not implemented."
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "Invalid punishment for acknowledgment.\r\n2: Invalid punishment for acknowledgment."
        },
        "401": {
            "description": "User isn't authenticated.\r\n0: Authorization has been denied for this request.\r\n0: User is unauthorized to process the request."
        },
        "200": {
            "description": "Returns an empty response.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        }
    },
    "Internal": false
}
```
<hr>


## /v1/not-approved
```json
{
    "Method": "GET",
    "Description": "Get the data for not approved for a currently authenticated but punished user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "Returns the worst unacknowledged punishment and its\r\n            its corresponding bad utterances, if exists. Otherwise, returns an empty response.",
            "schema": {
                "$ref": {
                    "properties": {
                        "punishmentId": {
                            "format": "int64",
                            "description": "Gets or sets the punishmentId",
                            "type": "integer"
                        },
                        "badUtterances": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "imageUrl": {
                                            "type": "string"
                                        },
                                        "utteranceText": {
                                            "type": "string"
                                        },
                                        "abuseType": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "Gets the bad utterances corresponding to the punishment"
                        },
                        "punishedUserId": {
                            "format": "int64",
                            "description": "Gets or sets the Roblox user ID of user being moderated",
                            "type": "integer"
                        },
                        "beginDate": {
                            "description": "Gets or sets the start date of punishment",
                            "type": "string"
                        },
                        "messageToUser": {
                            "description": "Gets or sets moderator message to user",
                            "type": "string"
                        },
                        "punishmentTypeDescription": {
                            "description": "Gets or sets the punishment type description",
                            "type": "string"
                        },
                        "endDate": {
                            "description": "Gets or sets the end date of punishment",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "501": {
            "description": "API is not implemented.\r\n1: Page is not available or not implemented."
        },
        "401": {
            "description": "User isn't authenticated.\r\n0: Authorization has been denied for this request.\r\n0: User is unauthorized to process the request."
        }
    },
    "Internal": false
}
```
<hr>


