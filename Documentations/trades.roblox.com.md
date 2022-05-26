# <b>Trades Api v1</b>

## /v1/trades/{tradeStatusType}
```json
{
    "Method": "GET",
    "Description": "Fetches a list of the authenticated user's trades.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "tradeStatusType",
            "enum": {
                "1": "Inbound",
                "2": "Outbound",
                "3": "Completed",
                "4": "Inactive"
            },
            "required": true,
            "description": "The trade status type."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by trade creation date",
            "name": "sortOrder",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 25,
                "3": 50,
                "4": 100
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "nextPageCursor": {
                            "type": "string"
                        },
                        "previousPageCursor": {
                            "type": "string"
                        },
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "user": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "expiration": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "status": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Unknown",
                                                "2": "Open",
                                                "3": "Pending",
                                                "4": "Completed",
                                                "5": "Expired",
                                                "6": "Declined",
                                                "7": "RejectedDueToError",
                                                "8": "Countered",
                                                "9": "Processing",
                                                "10": "InterventionRequired"
                                            }
                                        },
                                        "isActive": {
                                            "type": "boolean"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: Invalid trade status type."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/trades/send
```json
{
    "Method": "POST",
    "Description": "Sends a trade.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "body",
            "name": "tradeRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "offers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "robux": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userAssetIds": {
                                            "items": {
                                                "type": "integer",
                                                "format": "int64"
                                            },
                                            "type": "array"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The trade request."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "7: The user cannot trade. See field for whether the user who cannot trade is the sender or receiver.\r\n8: The trade request should include offers.\r\n9: Invalid number of trade offers.\r\n10: Invalid trade partner. See field for whether the invalid partner is the sender or receiver.\r\n11: Cannot add negative Robux amounts to a trade.\r\n12: One or more userAssets are invalid. See fieldData for details.\r\n13: Invalid number of userAssets in one side of the trade.\r\n15: The trade is unbalanced.\r\n16: Trade value ratio is not sufficient.\r\n17: You have insufficient Robux to make this offer.\r\n18: Too many Robux in one side of the offer. See field for whether the side is the sender or receiver.\r\n19: Unknown error while processing the trade.\r\n21: Cannot trade with yourself.\r\n22: User's privacy settings are too strict to allow trading. See field for whether the user is the sender or receiver."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "id": {
                            "format": "int64",
                            "description": "The trade id.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "14: You are sending too many trade requests. Please slow down and try again later."
        },
        "503": {
            "description": "5: Trading system is unavailable"
        }
    },
}
```
<hr>


## /v1/trades/metadata
```json
{
    "Method": "GET",
    "Description": "Gets metadata about the trade system.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "tradeSystemRobuxFee": {
                            "type": "number",
                            "format": "double"
                        },
                        "tradeSystemMaxRobuxPercent": {
                            "type": "number",
                            "format": "float"
                        },
                        "minValueRatio": {
                            "type": "number",
                            "format": "float"
                        },
                        "maxItemsPerSide": {
                            "type": "integer",
                            "format": "int32"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/users/{userId}/can-trade-with
```json
{
    "Method": "GET",
    "Description": "Returns whether you can trade with another user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The other user's id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "canTrade": {
                            "description": "Returns true if you can trade with the given user.",
                            "type": "boolean"
                        },
                        "status": {
                            "enum": {
                                "1": "Unknown",
                                "2": "CanTrade",
                                "3": "CannotTradeWithSelf",
                                "4": "SenderCannotTrade",
                                "5": "ReceiverCannotTrade",
                                "6": "SenderPrivacyTooStrict",
                                "7": "UsersCannotTrade"
                            },
                            "description": "If you can't trade with a user, status explains why you can't trade with them.",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "10: Invalid trade partner. See field for whether the invalid partner is the sender or receiver."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/trades/{tradeStatusType}/count
```json
{
    "Method": "GET",
    "Description": "Gets the total number of pending trades for the authenticated user.
Inbound is the only accepted tradeStatusType.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "tradeStatusType",
            "enum": {
                "1": "Inbound",
                "2": "Outbound",
                "3": "Completed",
                "4": "Inactive"
            },
            "required": true,
            "description": "The trade status type to fetch a total count for."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "count": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: Invalid trade status type."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/trades/{tradeId}
```json
{
    "Method": "GET",
    "Description": "Gets detailed information about a trade.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "tradeId",
            "format": "int64",
            "required": true,
            "description": "The trade id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "created": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "id": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "user": {
                            "$ref": {
                                "properties": {
                                    "id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "name": {
                                        "type": "string"
                                    },
                                    "displayName": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "expiration": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "status": {
                            "type": "string",
                            "enum": {
                                "1": "Unknown",
                                "2": "Open",
                                "3": "Pending",
                                "4": "Completed",
                                "5": "Expired",
                                "6": "Declined",
                                "7": "RejectedDueToError",
                                "8": "Countered",
                                "9": "Processing",
                                "10": "InterventionRequired"
                            }
                        },
                        "isActive": {
                            "type": "boolean"
                        },
                        "offers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "robux": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userAssets": {
                                            "items": {
                                                "$ref": {
                                                    "type": "object",
                                                    "description": "A model containing information about a UserAsset.",
                                                    "properties": {
                                                        "membershipType": {
                                                            "enum": {
                                                                "1": "None",
                                                                "2": "BC",
                                                                "3": "TBC",
                                                                "4": "OBC",
                                                                "5": "RobloxPremium"
                                                            },
                                                            "description": "The minimum MembershipType required to own the userAsset.",
                                                            "type": "string"
                                                        },
                                                        "assetId": {
                                                            "format": "int64",
                                                            "description": "The asset id of the user asset",
                                                            "type": "integer"
                                                        },
                                                        "serialNumber": {
                                                            "format": "int64",
                                                            "description": "The serial number of the user asset",
                                                            "type": "integer"
                                                        },
                                                        "originalPrice": {
                                                            "format": "int64",
                                                            "description": "The original price of the asset",
                                                            "type": "integer"
                                                        },
                                                        "id": {
                                                            "format": "int64",
                                                            "description": "The user asset id",
                                                            "type": "integer"
                                                        },
                                                        "assetStock": {
                                                            "format": "int64",
                                                            "description": "The asset stock.",
                                                            "type": "integer"
                                                        },
                                                        "recentAveragePrice": {
                                                            "format": "int64",
                                                            "description": "The recent average price of the asset",
                                                            "type": "integer"
                                                        },
                                                        "name": {
                                                            "description": "The asset name of the asset",
                                                            "type": "string"
                                                        }
                                                    }
                                                }
                                            },
                                            "type": "array"
                                        },
                                        "user": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    },
                                                    "displayName": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "2: The trade cannot be found or you are not authorized to view it."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/trades/{tradeId}/counter
```json
{
    "Method": "POST",
    "Description": "Counters a trade.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "tradeId",
            "format": "int64",
            "required": true,
            "description": "The trade id."
        },
        "2": {
            "in": "body",
            "name": "tradeRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "offers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "robux": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userAssetIds": {
                                            "items": {
                                                "type": "integer",
                                                "format": "int64"
                                            },
                                            "type": "array"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The trade request."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: The trade cannot be found or you are not authorized to view it.\r\n4: You are not authorized to modify this trade.\r\n7: The user cannot trade. See field for whether the user who cannot trade is the sender or receiver.\r\n8: The trade request should include offers.\r\n9: Invalid number of trade offers.\r\n10: Invalid trade partner. See field for whether the invalid partner is the sender or receiver.\r\n11: Cannot add negative Robux amounts to a trade.\r\n12: One or more userAssets are invalid. See fieldData for details.\r\n13: Invalid number of userAssets in one side of the trade.\r\n15: The trade is unbalanced.\r\n16: Trade value ratio is not sufficient.\r\n17: You have insufficient Robux to make this offer.\r\n18: Too many Robux in one side of the offer. See field for whether the side is the sender or receiver.\r\n19: Unknown error while processing the trade.\r\n21: Cannot trade with yourself.\r\n22: User's privacy settings are too strict to allow trading. See field for whether the user is the sender or receiver."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "id": {
                            "format": "int64",
                            "description": "The trade id.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "14: You are sending too many trade requests. Please slow down and try again later."
        },
        "503": {
            "description": "5: Trading system is unavailable"
        }
    },
}
```
<hr>


## /v1/trades/{tradeId}/accept
```json
{
    "Method": "POST",
    "Description": "Accepts a trade.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "tradeId",
            "format": "int64",
            "required": true,
            "description": "The trade id."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: The trade cannot be found or you are not authorized to view it.\r\n3: The trade is inactive.\r\n4: You are not authorized to modify this trade.\r\n6: Trade needs to be confirmed by the other party.\r\n6: Trade needs to be confirmed by the other party.\r\n7: The user cannot trade. See field for whether the user who cannot trade is the sender or receiver."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "5: Trading system is unavailable"
        }
    },
}
```
<hr>


## /v1/trades/{tradeId}/decline
```json
{
    "Method": "POST",
    "Description": "Declines a trade.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "tradeId",
            "format": "int64",
            "required": true,
            "description": "The trade id."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: The trade cannot be found or you are not authorized to view it.\r\n3: The trade is inactive.\r\n4: You are not authorized to modify this trade.\r\n7: The user cannot trade. See field for whether the user who cannot trade is the sender or receiver."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "5: Trading system is unavailable"
        }
    },
}
```
<hr>


