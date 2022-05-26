# <b>EngagementPayouts Api v1</b>

## /v1/universe-payout-history
```json
{
    "Method": "GET",
    "Description": "Gets the engagement payout history for a specific universe and a given date range, specified by start and end dates.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The ID of the universe in question."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "startDate",
            "required": true,
            "description": "The first date in the range, specified as yyyy-MM-dd."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "endDate",
            "required": true,
            "description": "The last date in the range, specified as yyyy-MM-dd."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "additionalProperties": {
                    "$ref": {
                        "type": "object",
                        "description": "A model for payout responses",
                        "properties": {
                            "eligibilityType": {
                                "type": "string",
                                "description": "Gets the eligibility type",
                                "readOnly": true
                            },
                            "engagementScore": {
                                "readOnly": true,
                                "format": "double",
                                "description": "Gets the engagement score",
                                "type": "number"
                            },
                            "payoutType": {
                                "type": "string",
                                "description": "Gets the payout type",
                                "readOnly": true
                            },
                            "payoutInRobux": {
                                "readOnly": true,
                                "format": "int64",
                                "description": "Gets the payout in Robux",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "object"
            }
        },
        "400": {
            "description": "1: InvalidUniverseId\r\n2: InvalidStartDate\r\n3: InvalidEndDate\r\n4: InvalidDateRange\r\n5: Forbidden\r\n6: TooManyDays"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


