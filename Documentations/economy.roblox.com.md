# <b>Economy Api v1</b>

## /v1/developer-exchange/help
```json
{
    "Method": "GET",
    "Description": ""NONE"",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/addfunds/latest
```json
{
    "Method": "GET",
    "Description": ""NONE"",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "rateLimitInDays": {
                            "format": "int64",
                            "description": "Days from the last transfer a new transfer is allowed",
                            "type": "integer"
                        },
                        "transactionDate": {
                            "description": "Date of latest transfer",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "3: Insufficient permissions."
        },
        "400": {
            "description": "2: The group is invalid."
        }
    },
}
```
<hr>


## /v1/assets/{assetId}/resellable-copies/{userAssetId}
```json
{
    "Method": "PATCH",
    "Description": "Sets copies of an asset owned by the authenticated user for sale",
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
            "name": "assetId",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "userAssetId",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "price": {
                            "format": "int64",
                            "description": "Price for user asset",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
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
        "403": {
            "description": "0: Token Validation Failed\r\n3: Insufficient permissions.\r\n6: The price is too low\r\n7: The price is too high\r\n8: Asset cannot be for resale\r\n9: The user does not own the asset"
        },
        "400": {
            "description": "5: The asset id is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request.\r\n1: The user is invalid."
        }
    },
}
```
<hr>


## /v1/assets/{assetId}/users/{userId}/resellable-copies
```json
{
    "Method": "GET",
    "Description": "Gets resellable copies of an asset owned by the authenticated user.",
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
            "description": "The user id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true,
            "description": "The asset id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A record of a user asset up for sale.",
                                    "properties": {
                                        "userAssetId": {
                                            "format": "int64",
                                            "description": "The user asset id.",
                                            "type": "integer"
                                        },
                                        "serialNumber": {
                                            "format": "int64",
                                            "description": "The user asset serial number.",
                                            "type": "integer"
                                        },
                                        "seller": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
                                                        },
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The entity selling the user asset."
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The price of the user asset.",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "3: Insufficient permissions."
        },
        "400": {
            "description": "5: The asset id is invalid."
        }
    },
}
```
<hr>


## /v1/developer-exchange/cashoutAbility
```json
{
    "Method": "GET",
    "Description": "Gets information regarding whether user can cash out, and any specific reasons why the user would not be able to cashout.",
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
                    "type": "object",
                    "description": "The response model for {M:Roblox.Economy.Api.Controllers.V1.CashOutController.CashOutAbility}",
                    "properties": {
                        "lastImbursementStatusIsValid": {
                            "type": "boolean",
                            "description": "Gets a value indicating whether the user's last imbursement status, if any, is valid.",
                            "readOnly": true
                        },
                        "canCashOut": {
                            "type": "boolean",
                            "description": "Gets a value indicating whether the user can cash out.",
                            "readOnly": true
                        },
                        "hasCashedOutThisMonth": {
                            "type": "boolean",
                            "description": "Gets a value indicating whether the user has cashed out this month.",
                            "readOnly": true
                        },
                        "meetsMinimumCashOutBalance": {
                            "type": "boolean",
                            "description": "Gets a value indicating whether the user meets the minimum cash out balance.",
                            "readOnly": true
                        },
                        "meetsPremiumRequirement": {
                            "type": "boolean",
                            "description": "Gets a value indicating whether the user meets the Premium requirement",
                            "readOnly": true
                        },
                        "isUserBlackListed": {
                            "type": "boolean",
                            "description": "Gets a value indicating whether the user is blacklisted.",
                            "readOnly": true
                        },
                        "hasVerifiedEmail": {
                            "type": "boolean",
                            "description": "Gets a value indicating whether the user has verified email address.",
                            "readOnly": true
                        }
                    }
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


## /v1/developer-exchange/submit
```json
{
    "Method": "POST",
    "Description": "Submits a request to cash out.",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The request model for {M:Roblox.Economy.Api.Controllers.V1.CashOutController.Submit(Roblox.Economy.Api.Models.SubmitRequestModel)}",
                    "properties": {
                        "password": {
                            "description": "Gets or sets the user's password.",
                            "type": "string"
                        },
                        "paypalEmail": {
                            "description": "Gets or sets the user's paypal email address.",
                            "type": "string"
                        },
                        "robux": {
                            "format": "int32",
                            "description": "Gets or sets the amount of Robux to cash out for this submission.",
                            "type": "integer"
                        },
                        "country": {
                            "description": "Gets or sets the user's country, represented as a string.",
                            "type": "string"
                        },
                        "lastName": {
                            "description": "Gets or sets the user's last name",
                            "type": "string"
                        },
                        "firstName": {
                            "description": "Gets or sets the user's first name.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A data model represent response for {M:Roblox.Economy.Api.Controllers.V1.CashOutController.Submit(Roblox.Economy.Api.Models.SubmitRequestModel)}",
                    "properties": {
                        "errors": {
                            "readOnly": true,
                            "type": "object",
                            "additionalProperties": {
                                "type": "string"
                            },
                            "description": "Gets any errors.  If there are no errors, this will be NULL."
                        },
                        "cashOutAbility": {
                            "readOnly": true,
                            "$ref": {
                                "type": "object",
                                "description": "The response model for {M:Roblox.Economy.Api.Controllers.V1.CashOutController.CashOutAbility}",
                                "properties": {
                                    "lastImbursementStatusIsValid": {
                                        "type": "boolean",
                                        "description": "Gets a value indicating whether the user's last imbursement status, if any, is valid.",
                                        "readOnly": true
                                    },
                                    "canCashOut": {
                                        "type": "boolean",
                                        "description": "Gets a value indicating whether the user can cash out.",
                                        "readOnly": true
                                    },
                                    "hasCashedOutThisMonth": {
                                        "type": "boolean",
                                        "description": "Gets a value indicating whether the user has cashed out this month.",
                                        "readOnly": true
                                    },
                                    "meetsMinimumCashOutBalance": {
                                        "type": "boolean",
                                        "description": "Gets a value indicating whether the user meets the minimum cash out balance.",
                                        "readOnly": true
                                    },
                                    "meetsPremiumRequirement": {
                                        "type": "boolean",
                                        "description": "Gets a value indicating whether the user meets the Premium requirement",
                                        "readOnly": true
                                    },
                                    "isUserBlackListed": {
                                        "type": "boolean",
                                        "description": "Gets a value indicating whether the user is blacklisted.",
                                        "readOnly": true
                                    },
                                    "hasVerifiedEmail": {
                                        "type": "boolean",
                                        "description": "Gets a value indicating whether the user has verified email address.",
                                        "readOnly": true
                                    }
                                }
                            },
                            "description": "Gets the user's cashoutability.  Can be NULL if there are unexpected errors."
                        },
                        "submitted": {
                            "type": "boolean",
                            "description": "Gets a value indicating whether the request is successfully submitted.",
                            "readOnly": true
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/revenue/summary/{timeFrame}
```json
{
    "Method": "GET",
    "Description": "Gets recent Robux revenue summary for a group.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group id to get Robux summary for."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "timeFrame",
            "enum": {
                "1": "Day",
                "2": "Week",
                "3": "Month",
                "4": "Year"
            },
            "required": true,
            "description": "The {Roblox.Economy.Api.RevenueSummaryTimeFrame} to get for."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Robux revenue summary response.",
                    "properties": {
                        "itemSaleRobux": {
                            "format": "int64",
                            "description": "Robux from sale of goods.",
                            "type": "integer"
                        },
                        "recurringRobuxStipend": {
                            "format": "int64",
                            "description": "Number of Robux from recurring stipends.",
                            "type": "integer"
                        },
                        "tradeSystemRobux": {
                            "format": "int64",
                            "description": "Robux obtained via trade.",
                            "type": "integer"
                        },
                        "pendingRobux": {
                            "format": "int64",
                            "description": "Number of Robux in pending.",
                            "type": "integer"
                        },
                        "groupPayoutRobux": {
                            "format": "int64",
                            "description": "Robux via group payouts.",
                            "type": "integer"
                        },
                        "purchasedRobux": {
                            "format": "int64",
                            "description": "Robux purchased.",
                            "type": "integer"
                        },
                        "individualToGroupRobux": {
                            "format": "int64",
                            "description": "Robux via group payouts.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "3: Insufficient permissions."
        },
        "400": {
            "description": "2: The group is invalid.\r\n4: The time frame is not supported or is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/addfunds/allowed
```json
{
    "Method": "GET",
    "Description": ""NONE"",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "boolean"
            }
        },
        "403": {
            "description": "3: Insufficient permissions."
        },
        "400": {
            "description": "2: The group is invalid."
        }
    },
}
```
<hr>


## /v1/developer-exchange/info
```json
{
    "Method": "GET",
    "Description": "Retrieves information needed to display in the cash out widget or page",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "boolean",
            "name": "fromDevExPage",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for the Cashout Widgent endpoint",
                    "properties": {
                        "showOnlyExchangeRates": {
                            "description": "Whether only exchange rates should be shown",
                            "type": "boolean"
                        },
                        "showProgressBar": {
                            "description": "Whether to show the progress bar",
                            "type": "boolean"
                        },
                        "hasCurrencyOperationError": {
                            "type": "boolean"
                        },
                        "canProceedToCashout": {
                            "description": "Whether the user can proceed to cash out",
                            "type": "boolean"
                        },
                        "conversionPercent": {
                            "readOnly": true,
                            "format": "double",
                            "description": "The conversion percent",
                            "type": "number"
                        },
                        "minRobuxToCashOut": {
                            "readOnly": true,
                            "format": "int64",
                            "description": "The minimum amount of Robux needed for DevEx",
                            "type": "integer"
                        },
                        "lastImbursementStatus": {
                            "description": "The last imbursement status for the user, if any",
                            "type": "string"
                        },
                        "maxRobuxCanCashOut": {
                            "readOnly": true,
                            "format": "int32",
                            "description": "The max Robux that can be cashed out",
                            "type": "integer"
                        },
                        "percentRobux": {
                            "format": "int32",
                            "description": "The user's Robux balance as a percentage of the minimum amount for DevEx.\r\nIf the user's Robux balance exceeds the target, this value will be 100.",
                            "type": "integer"
                        },
                        "meetsMembershipRequirements": {
                            "description": "Whether the user meets membership requirements.",
                            "type": "boolean"
                        },
                        "lastImbursementSubmissionDate": {
                            "format": "date-time",
                            "description": "The submission date for the last imbursement request, if any.",
                            "type": "string"
                        },
                        "currencyOperationErrorMessage": {
                            "type": "string"
                        },
                        "emailIsVerified": {
                            "description": "Whether the user's email is verified",
                            "type": "boolean"
                        },
                        "isImbursementBlacklistUser": {
                            "description": "Whether the user is blacklisted from DevEx",
                            "type": "boolean"
                        }
                    }
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


## /v1/resale-tax-rate
```json
{
    "Method": "GET",
    "Description": "Gets asset resale related metadata.",
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
                        "minimumFee": {
                            "format": "int64",
                            "description": "The minimum marketplace fee Robux for resale",
                            "type": "integer"
                        },
                        "taxRate": {
                            "format": "float",
                            "description": "The tax rate for resale",
                            "type": "number"
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


## /v1/assets/{assetId}/resale-data
```json
{
    "Method": "GET",
    "Description": "Gets asset resale data.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true,
            "description": "The asset id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Resale data for an item.",
                    "properties": {
                        "priceDataPoints": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Chart data point.",
                                    "properties": {
                                        "value": {
                                            "format": "int64",
                                            "description": "The value of the data point.",
                                            "type": "integer"
                                        },
                                        "date": {
                                            "format": "date-time",
                                            "description": "The date associated with the data point.",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Price points for the past 180 days."
                        },
                        "numberRemaining": {
                            "format": "int64",
                            "description": "How many of the item remain to be sold.",
                            "type": "integer"
                        },
                        "originalPrice": {
                            "format": "int64",
                            "description": "The original selling price for the item.",
                            "type": "integer"
                        },
                        "assetStock": {
                            "format": "int64",
                            "description": "The total number of this item that can be sold.",
                            "type": "integer"
                        },
                        "sales": {
                            "format": "int64",
                            "description": "How many of the item have been sold.",
                            "type": "integer"
                        },
                        "recentAveragePrice": {
                            "format": "int64",
                            "description": "The recent average selling price of the item.",
                            "type": "integer"
                        },
                        "volumeDataPoints": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Chart data point.",
                                    "properties": {
                                        "value": {
                                            "format": "int64",
                                            "description": "The value of the data point.",
                                            "type": "integer"
                                        },
                                        "date": {
                                            "format": "date-time",
                                            "description": "The date associated with the data point.",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Volume points for the past 180 days."
                        }
                    }
                }
            }
        },
        "400": {
            "description": "5: The asset id is invalid."
        }
    },
}
```
<hr>


## /v1/assets/{assetId}/resellers
```json
{
    "Method": "GET",
    "Description": "Gets available resale copies of an asset.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true,
            "description": "The asset id."
        },
        "2": {
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
        "3": {
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
                                    "type": "object",
                                    "description": "A record of a user asset up for sale.",
                                    "properties": {
                                        "userAssetId": {
                                            "format": "int64",
                                            "description": "The user asset id.",
                                            "type": "integer"
                                        },
                                        "serialNumber": {
                                            "format": "int64",
                                            "description": "The user asset serial number.",
                                            "type": "integer"
                                        },
                                        "seller": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
                                                        },
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The entity selling the user asset."
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The price of the user asset.",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array"
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


## /v1/purchases/products/{productId}
```json
{
    "Method": "POST",
    "Description": "Purchases a product given its id.",
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
            "name": "productId",
            "format": "int64",
            "required": true,
            "description": "The id of the product."
        },
        "2": {
            "in": "body",
            "name": "purchaseDetail",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Purchase detail request model.",
                    "properties": {
                        "saleLocationType": {
                            "type": "string",
                            "enum": {
                                "1": "Website",
                                "2": "Game"
                            }
                        },
                        "saleLocationId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "expectedSellerId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "expectedPrice": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "userAssetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "expectedCurrency": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "expectedPromoId": {
                            "type": "integer",
                            "format": "int64"
                        }
                    }
                }
            },
            "description": "The product purchase details."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Purchase detail request model.",
                    "properties": {
                        "assetName": {
                            "type": "string"
                        },
                        "purchased": {
                            "type": "boolean"
                        },
                        "price": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "transactionVerb": {
                            "type": "string"
                        },
                        "assetType": {
                            "type": "string"
                        },
                        "reason": {
                            "type": "string",
                            "enum": {
                                "1": "Success",
                                "2": "AlreadyOwned",
                                "3": "ApplicationError",
                                "4": "EconomyDisabled",
                                "5": "InsufficientFunds",
                                "6": "InsufficientMembership",
                                "7": "InvalidTransaction",
                                "8": "NotAvailableInRobux",
                                "9": "NotForSale",
                                "10": "PriceChanged",
                                "11": "SaleExpired",
                                "12": "SupplyExausted",
                                "13": "ContentRatingRestricted",
                                "14": "UnknownBirthday",
                                "15": "AffiliateSalesDisabled",
                                "16": "BadAffiliateSaleProduct",
                                "17": "ExceptionOccurred",
                                "18": "IOSOnlyItem",
                                "19": "InvalidArguments",
                                "20": "TooManyPurchases",
                                "21": "Unauthorized",
                                "22": "AccountRestrictionsRestricted",
                                "23": "PendingTransactionAlreadyExists",
                                "24": "SaleUnavailableAtSaleLocation"
                            }
                        },
                        "assetIsWearable": {
                            "type": "boolean"
                        },
                        "assetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "productId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "statusCode": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "assetTypeDisplayName": {
                            "type": "string"
                        },
                        "balanceAfterSale": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "premiumPricing": {
                            "$ref": {
                                "type": "object",
                                "description": "Defines the Premium pricing for a product",
                                "properties": {
                                    "premiumDiscountPercentage": {
                                        "format": "int32",
                                        "description": "The Premium discount percentage for a product",
                                        "type": "integer"
                                    },
                                    "premiumPriceInRobux": {
                                        "format": "int64",
                                        "description": "The Premium price for a product",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "The Premium pricing information for the product."
                        },
                        "errorMsg": {
                            "type": "string"
                        },
                        "isMultiPrivateSale": {
                            "type": "boolean"
                        },
                        "showDivId": {
                            "type": "string"
                        },
                        "sellerName": {
                            "type": "string"
                        },
                        "expectedPrice": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "currency": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "shortfallPrice": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "title": {
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: The user is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/addfunds
```json
{
    "Method": "POST",
    "Description": ""NONE"",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/x-www-form-urlencoded"
    },
    "Produces": "NONE",
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "body",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "robuxAmount": {
                            "format": "int64",
                            "description": "Robux to Transfer to Group",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "204": {
            "description": "No Content"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n3: Insufficient permissions.\r\n11: The requested feature is currently unavailable.\r\n15: Previous Transaction too Recent."
        },
        "400": {
            "description": "2: The group is invalid.\r\n14: Robux amount out of bounds.\r\n16: Insufficient Funds"
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/users-payout-eligibility
```json
{
    "Method": "GET",
    "Description": "Gets the group payout eligibility for a group of users.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "name": "userIds"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for {M:Roblox.Economy.Api.Controllers.V1.GroupPayoutsController.GetUserGroupPayoutEligibility(System.Int64,System.Collections.Generic.ICollection{System.Int64})}",
                    "properties": {
                        "usersGroupPayoutEligibility": {
                            "additionalProperties": {
                                "type": "string",
                                "enum": {
                                    "1": "Undefined",
                                    "2": "Eligible",
                                    "3": "NotInGroup",
                                    "4": "PayoutRestricted"
                                }
                            },
                            "type": "object"
                        }
                    }
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


## /v1/groups/{groupId}/currency
```json
{
    "Method": "GET",
    "Description": "Gets currency for the specified group.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group Id to get the currency for."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "robux": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "3: Insufficient permissions."
        },
        "400": {
            "description": "2: The group is invalid."
        }
    },
}
```
<hr>


## /v1/groups/{groupId}/transactions
```json
{
    "Method": "GET",
    "Description": "Fetches the transaction history for a group.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "transactionType",
            "enum": {
                "1": "Sale",
                "2": "Purchase",
                "3": "AffiliateSale",
                "4": "DevEx",
                "5": "GroupPayout",
                "6": "AdImpressionPayout",
                "7": "CurrencyPurchase",
                "8": "TradeRobux",
                "9": "PremiumStipend",
                "10": "PendingRobux",
                "11": "EngagementPayout",
                "12": "GroupEngagementPayout",
                "13": "AdSpend",
                "14": "Summary",
                "15": "IndividualToGroup",
                "16": "CSAdjustment"
            },
            "required": true
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
        "403": {
            "description": "3: Insufficient permissions."
        },
        "400": {
            "description": "2: The group is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
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
                                    "type": "object",
                                    "description": "Response model for a virtual economy transaction.",
                                    "properties": {
                                        "created": {
                                            "format": "date-time",
                                            "description": "The timestamp the transaction occurred.",
                                            "type": "string"
                                        },
                                        "currency": {
                                            "$ref": {
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": {
                                                            "1": "Robux",
                                                            "2": "Tickets"
                                                        }
                                                    },
                                                    "amount": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The transaction's currency amount and type."
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The id",
                                            "type": "integer"
                                        },
                                        "agent": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Represents an agent, which can be either a user or a group.",
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
                                                        },
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The other agent in the transaction. Can be a user or a group."
                                        },
                                        "details": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Base class that represents the item in the transaction.",
                                                "properties": {
                                                }
                                            },
                                            "description": "The transaction details. Includes different information based on transaction type."
                                        },
                                        "isPending": {
                                            "description": "Whether or not the transaction is pending.",
                                            "type": "boolean"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "11: The requested feature is currently unavailable."
        }
    },
}
```
<hr>


## /v1/products/{productId}
```json
{
    "Method": "GET",
    "Description": "Retrieves the product purchasable details given its id.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "productId",
            "format": "int64",
            "required": true,
            "description": "The id of the product."
        },
        "2": {
            "in": "query",
            "type": "boolean",
            "name": "showPurchasable",
            "description": "true if purchase validation is needed.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Purchasable detail request model.",
                    "properties": {
                        "assetName": {
                            "type": "string"
                        },
                        "price": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "transactionVerb": {
                            "type": "string"
                        },
                        "assetType": {
                            "type": "string"
                        },
                        "reason": {
                            "type": "string",
                            "enum": {
                                "1": "Success",
                                "2": "AlreadyOwned",
                                "3": "ApplicationError",
                                "4": "EconomyDisabled",
                                "5": "InsufficientFunds",
                                "6": "InsufficientMembership",
                                "7": "InvalidTransaction",
                                "8": "NotAvailableInRobux",
                                "9": "NotForSale",
                                "10": "PriceChanged",
                                "11": "SaleExpired",
                                "12": "SupplyExausted",
                                "13": "ContentRatingRestricted",
                                "14": "UnknownBirthday",
                                "15": "AffiliateSalesDisabled",
                                "16": "BadAffiliateSaleProduct",
                                "17": "ExceptionOccurred",
                                "18": "IOSOnlyItem",
                                "19": "InvalidArguments",
                                "20": "TooManyPurchases",
                                "21": "Unauthorized",
                                "22": "AccountRestrictionsRestricted",
                                "23": "PendingTransactionAlreadyExists",
                                "24": "SaleUnavailableAtSaleLocation"
                            }
                        },
                        "assetIsWearable": {
                            "type": "boolean"
                        },
                        "assetId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "productId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "statusCode": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "assetTypeDisplayName": {
                            "type": "string"
                        },
                        "balanceAfterSale": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "isMultiPrivateSale": {
                            "type": "boolean"
                        },
                        "premiumPricing": {
                            "$ref": {
                                "type": "object",
                                "description": "Defines the Premium pricing for a product",
                                "properties": {
                                    "premiumDiscountPercentage": {
                                        "format": "int32",
                                        "description": "The Premium discount percentage for a product",
                                        "type": "integer"
                                    },
                                    "premiumPriceInRobux": {
                                        "format": "int64",
                                        "description": "The Premium price for a product",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "The Premium pricing information for the product."
                        },
                        "errorMsg": {
                            "type": "string"
                        },
                        "sellerName": {
                            "type": "string"
                        },
                        "title": {
                            "type": "string"
                        },
                        "currency": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "expectedPrice": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "purchasable": {
                            "type": "boolean"
                        },
                        "shortfallPrice": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "showDivId": {
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The user is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/users/{userId}/currency
```json
{
    "Method": "GET",
    "Description": "Gets currency for the specified user.",
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
            "description": "The user Id to get the currency for."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "robux": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "1: The user is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


# <b>Economy Api v2</b>

## /v2/developer-products/{productId}/purchase
```json
{
    "Method": "POST",
    "Description": "Purchases a User Product given its product id.",
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
            "name": "productId",
            "format": "int64",
            "required": true,
            "description": "The id of the product."
        },
        "2": {
            "in": "body",
            "name": "purchaseDetail",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Purchase detail request model.",
                    "properties": {
                        "expectedPrice": {
                            "format": "int64",
                            "description": "Expected Price for product",
                            "type": "integer"
                        },
                        "requestId": {
                            "description": "Client Request Id",
                            "type": "string"
                        },
                        "saleLocationType": {
                            "enum": {
                                "1": "Website",
                                "2": "Game"
                            },
                            "description": "Source of Sale, Defaults to Website",
                            "type": "string"
                        },
                        "saleLocationId": {
                            "format": "int64",
                            "description": "Source of Sale identification, Defaults to null",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The product purchase details."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Purchase response model.",
                    "properties": {
                        "success": {
                            "type": "boolean"
                        },
                        "purchased": {
                            "type": "boolean"
                        },
                        "price": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "receipt": {
                            "type": "string"
                        },
                        "productId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "transactionStatus": {
                            "type": "string",
                            "enum": {
                                "1": "Success",
                                "2": "AlreadyOwned",
                                "3": "ApplicationError",
                                "4": "EconomyDisabled",
                                "5": "InsufficientFunds",
                                "6": "InsufficientMembership",
                                "7": "InvalidTransaction",
                                "8": "NotAvailableInRobux",
                                "9": "NotForSale",
                                "10": "PriceChanged",
                                "11": "SaleExpired",
                                "12": "SupplyExausted",
                                "13": "ContentRatingRestricted",
                                "14": "UnknownBirthday",
                                "15": "AffiliateSalesDisabled",
                                "16": "BadAffiliateSaleProduct",
                                "17": "ExceptionOccurred",
                                "18": "IOSOnlyItem",
                                "19": "InvalidArguments",
                                "20": "TooManyPurchases",
                                "21": "Unauthorized",
                                "22": "AccountRestrictionsRestricted",
                                "23": "PendingTransactionAlreadyExists",
                                "24": "SaleUnavailableAtSaleLocation"
                            }
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The user is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v2/users/{userId}/transactions
```json
{
    "Method": "GET",
    "Description": "Fetches the transaction history for the authenticated user.",
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
            "required": true
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "transactionType",
            "enum": {
                "1": "Sale",
                "2": "Purchase",
                "3": "AffiliateSale",
                "4": "DevEx",
                "5": "GroupPayout",
                "6": "AdImpressionPayout",
                "7": "CurrencyPurchase",
                "8": "TradeRobux",
                "9": "PremiumStipend",
                "10": "PendingRobux",
                "11": "EngagementPayout",
                "12": "GroupEngagementPayout",
                "13": "AdSpend",
                "14": "Summary",
                "15": "IndividualToGroup",
                "16": "CSAdjustment"
            },
            "required": true
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
        },
        "5": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
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
                                    "type": "object",
                                    "description": "Response model for a virtual economy transaction record.",
                                    "properties": {
                                        "created": {
                                            "format": "date-time",
                                            "description": "The timestamp the transaction occurred.",
                                            "type": "string"
                                        },
                                        "currency": {
                                            "$ref": {
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": {
                                                            "1": "Robux",
                                                            "2": "Tickets"
                                                        }
                                                    },
                                                    "amount": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The transaction's currency amount and type."
                                        },
                                        "details": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Base class that represents the item in the transaction.",
                                                "properties": {
                                                }
                                            },
                                            "description": "The transaction details. Includes different information based on transaction type."
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The database id of the hold",
                                            "type": "integer"
                                        },
                                        "transactionType": {
                                            "description": "The type of the transaction",
                                            "type": "string"
                                        },
                                        "agent": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Represents an agent, which can be either a user or a group.",
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
                                                        },
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The other agent in the transaction. Can be a user or a group."
                                        },
                                        "isPending": {
                                            "description": "Whether or not the transaction is pending.",
                                            "type": "boolean"
                                        }
                                    }
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
            "description": "1: The user is invalid.\r\n12: Invalid transaction type."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v2/groups/{groupId}/transactions
```json
{
    "Method": "GET",
    "Description": "Fetches the transaction history for a group.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "required": true
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "transactionType",
            "enum": {
                "1": "Sale",
                "2": "Purchase",
                "3": "AffiliateSale",
                "4": "DevEx",
                "5": "GroupPayout",
                "6": "AdImpressionPayout",
                "7": "CurrencyPurchase",
                "8": "TradeRobux",
                "9": "PremiumStipend",
                "10": "PendingRobux",
                "11": "EngagementPayout",
                "12": "GroupEngagementPayout",
                "13": "AdSpend",
                "14": "Summary",
                "15": "IndividualToGroup",
                "16": "CSAdjustment"
            },
            "required": true
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
        },
        "5": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
        }
    },
    "Responses": {
        "403": {
            "description": "3: Insufficient permissions."
        },
        "400": {
            "description": "2: The group is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
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
                                    "type": "object",
                                    "description": "Response model for a virtual economy transaction.",
                                    "properties": {
                                        "created": {
                                            "format": "date-time",
                                            "description": "The timestamp the transaction occurred.",
                                            "type": "string"
                                        },
                                        "currency": {
                                            "$ref": {
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": {
                                                            "1": "Robux",
                                                            "2": "Tickets"
                                                        }
                                                    },
                                                    "amount": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The transaction's currency amount and type."
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The id",
                                            "type": "integer"
                                        },
                                        "agent": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Represents an agent, which can be either a user or a group.",
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "Group"
                                                        },
                                                        "readOnly": true,
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The other agent in the transaction. Can be a user or a group."
                                        },
                                        "details": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Base class that represents the item in the transaction.",
                                                "properties": {
                                                }
                                            },
                                            "description": "The transaction details. Includes different information based on transaction type."
                                        },
                                        "isPending": {
                                            "description": "Whether or not the transaction is pending.",
                                            "type": "boolean"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "11: The requested feature is currently unavailable."
        }
    },
}
```
<hr>


## /v2/user-products/{productId}/purchase
```json
{
    "Method": "POST",
    "Description": "Purchases a User Product given its product id.",
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
            "name": "productId",
            "format": "int64",
            "required": true,
            "description": "The id of the product."
        },
        "2": {
            "in": "body",
            "name": "purchaseDetail",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Purchase detail request model.",
                    "properties": {
                        "expectedPrice": {
                            "format": "int64",
                            "description": "Expected Price for product",
                            "type": "integer"
                        },
                        "requestId": {
                            "description": "Client Request Id",
                            "type": "string"
                        },
                        "saleLocationType": {
                            "enum": {
                                "1": "Website",
                                "2": "Game"
                            },
                            "description": "Source of Sale, Defaults to Website",
                            "type": "string"
                        },
                        "saleLocationId": {
                            "format": "int64",
                            "description": "Source of Sale identification, Defaults to null",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The product purchase details."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Purchase response model.",
                    "properties": {
                        "success": {
                            "type": "boolean"
                        },
                        "purchased": {
                            "type": "boolean"
                        },
                        "price": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "receipt": {
                            "type": "string"
                        },
                        "productId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "transactionStatus": {
                            "type": "string",
                            "enum": {
                                "1": "Success",
                                "2": "AlreadyOwned",
                                "3": "ApplicationError",
                                "4": "EconomyDisabled",
                                "5": "InsufficientFunds",
                                "6": "InsufficientMembership",
                                "7": "InvalidTransaction",
                                "8": "NotAvailableInRobux",
                                "9": "NotForSale",
                                "10": "PriceChanged",
                                "11": "SaleExpired",
                                "12": "SupplyExausted",
                                "13": "ContentRatingRestricted",
                                "14": "UnknownBirthday",
                                "15": "AffiliateSalesDisabled",
                                "16": "BadAffiliateSaleProduct",
                                "17": "ExceptionOccurred",
                                "18": "IOSOnlyItem",
                                "19": "InvalidArguments",
                                "20": "TooManyPurchases",
                                "21": "Unauthorized",
                                "22": "AccountRestrictionsRestricted",
                                "23": "PendingTransactionAlreadyExists",
                                "24": "SaleUnavailableAtSaleLocation"
                            }
                        }
                    }
                }
            }
        },
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "1: The user is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v2/users/{userId}/transaction-types
```json
{
    "Method": "GET",
    "Description": "Gets the transaction types that a user has used at any point in their account's lifetime.",
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
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model detailing the transaction types a user has used in their account lifetime.",
                    "properties": {
                        "HasGroupEngagementPayout": {
                            "type": "boolean"
                        },
                        "HasDevEx": {
                            "type": "boolean"
                        },
                        "HasAffiliateSale": {
                            "type": "boolean"
                        },
                        "HasGroupPayout": {
                            "type": "boolean"
                        },
                        "HasSale": {
                            "type": "boolean"
                        },
                        "HasIndividualToGroup": {
                            "type": "boolean"
                        },
                        "HasAdSpend": {
                            "type": "boolean"
                        },
                        "HasEngagementPayout": {
                            "type": "boolean"
                        },
                        "HasCSAdjustment": {
                            "type": "boolean"
                        },
                        "HasTradeRobux": {
                            "type": "boolean"
                        },
                        "HasCurrencyPurchase": {
                            "type": "boolean"
                        },
                        "HasPremiumStipend": {
                            "type": "boolean"
                        },
                        "HasPurchase": {
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The user is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v2/assets/{assetId}/details
```json
{
    "Method": "GET",
    "Description": "Retrieves the product and asset details given its id.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "assetId",
            "format": "int64",
            "required": true,
            "description": "The id of the asset."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "AssetTypeId": {
                            "format": "int32",
                            "description": "The assetType Id",
                            "type": "integer"
                        },
                        "TargetId": {
                            "format": "int64",
                            "description": "The target Id",
                            "type": "integer"
                        },
                        "IsNew": {
                            "description": "Is New ?",
                            "type": "boolean"
                        },
                        "Updated": {
                            "format": "date-time",
                            "description": "Updated Datetime",
                            "type": "string"
                        },
                        "IsLimitedUnique": {
                            "description": "Is Limited Unique",
                            "type": "boolean"
                        },
                        "ProductId": {
                            "format": "int64",
                            "description": "The product Id",
                            "type": "integer"
                        },
                        "MinimumMembershipLevel": {
                            "format": "int32",
                            "description": "Minimum membership level needed",
                            "type": "integer"
                        },
                        "PremiumPriceInRobux": {
                            "format": "int64",
                            "description": "Nullable Premium price in Robux",
                            "type": "integer"
                        },
                        "Created": {
                            "format": "date-time",
                            "description": "Created Datetime",
                            "type": "string"
                        },
                        "ProductType": {
                            "description": "The type of product requested",
                            "type": "string"
                        },
                        "IsLimited": {
                            "description": "Is Limited ?",
                            "type": "boolean"
                        },
                        "Remaining": {
                            "format": "int64",
                            "description": "Nullable Num of Remainning",
                            "type": "integer"
                        },
                        "ContentRatingTypeId": {
                            "format": "int32",
                            "description": "Content Rating Type Id",
                            "type": "integer"
                        },
                        "Description": {
                            "description": "Description of the asset",
                            "type": "string"
                        },
                        "Sales": {
                            "format": "int64",
                            "description": "Num of Sales",
                            "type": "integer"
                        },
                        "IsPublicDomain": {
                            "description": "Is Public Domain ?",
                            "type": "boolean"
                        },
                        "PriceInRobux": {
                            "format": "int64",
                            "description": "Nullable Price in Robux",
                            "type": "integer"
                        },
                        "Name": {
                            "description": "Name of the asset",
                            "type": "string"
                        },
                        "IsForSale": {
                            "description": "Is For Sale ?",
                            "type": "boolean"
                        },
                        "IconImageAssetId": {
                            "format": "int64",
                            "description": "Icon Image Asset Id",
                            "type": "integer"
                        },
                        "Creator": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "format": "int64",
                                        "description": "Id of the Creator",
                                        "type": "integer"
                                    },
                                    "CreatorType": {
                                        "description": "Type of the Creator",
                                        "type": "string"
                                    },
                                    "Name": {
                                        "description": "Name of the Creator",
                                        "type": "string"
                                    },
                                    "CreatorTargetId": {
                                        "format": "int64",
                                        "description": "TargetId for the Creator",
                                        "type": "integer"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "Creator information"
                        },
                        "PriceInTickets": {
                            "format": "int64",
                            "description": "Nullable Price in Tickets",
                            "type": "integer"
                        },
                        "AssetId": {
                            "format": "int64",
                            "description": "The asset Id",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "5: The asset id is invalid.\r\n20: No Product Info found associated with the AssetId."
        },
        "503": {
            "description": "11: The requested feature is currently unavailable."
        }
    },
}
```
<hr>


## /v2/users/{userId}/transaction-totals
```json
{
    "Method": "GET",
    "Description": "Gets recent transaction total summaries for the Authenticated User.",
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
            "required": true
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "timeFrame",
            "enum": {
                "1": "Day",
                "2": "Week",
                "3": "Month",
                "4": "Year"
            },
            "required": true,
            "description": "The {Roblox.Economy.Api.RevenueSummaryTimeFrame} to get for."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "transactionType",
            "enum": {
                "1": "Sale",
                "2": "Purchase",
                "3": "AffiliateSale",
                "4": "DevEx",
                "5": "GroupPayout",
                "6": "AdImpressionPayout",
                "7": "CurrencyPurchase",
                "8": "TradeRobux",
                "9": "PremiumStipend",
                "10": "PendingRobux",
                "11": "EngagementPayout",
                "12": "GroupEngagementPayout",
                "13": "AdSpend",
                "14": "Summary",
                "15": "IndividualToGroup",
                "16": "CSAdjustment"
            },
            "required": true
        },
        "4": {
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
        "5": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        },
        "6": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a virtual economy transaction totals.",
                    "properties": {
                        "tradeSystemEarningsTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "incomingRobuxTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "tradeSystemCostsTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "affiliateSalesTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "salesTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "outgoingRobuxTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "adSpendTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "premiumPayoutsTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "pendingRobuxTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "groupPayoutsTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "groupPremiumPayoutsTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "developerExchangeTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "csAdjustmentTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "individualToGroupTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "currencyPurchasesTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "premiumStipendsTotal": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "purchasesTotal": {
                            "type": "integer",
                            "format": "int64"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The user is invalid.\r\n4: The time frame is not supported or is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


