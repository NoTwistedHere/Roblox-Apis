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


