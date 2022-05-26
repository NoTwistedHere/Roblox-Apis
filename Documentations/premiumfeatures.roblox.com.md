# <b>PremiumFeatures Api v1</b>

## /v1/users/{userId}/subscriptions
```json
{
    "Method": "PATCH",
    "Description": "Updates the subscription and returns the new Subscription product for the User.",
    "Consumes": "NONE",
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
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "productId",
            "format": "int32",
            "required": true,
            "description": "The ID of the product"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
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

```json
{
    "Method": "GET",
    "Description": "Gets a user's current subscription product",
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
            "description": "User ID"
        }
    },
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


## /v1/users/buy-robux-settings
```json
{
    "Method": "GET",
    "Description": "Gets robux page settings for the authenticated user",
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


## /v1/users/{userId}/subscriptions/cancel
```json
{
    "Method": "POST",
    "Description": "Cancel membership endpoint that works for both the new subscription product and BC",
    "Consumes": "NONE",
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
                "type": "object"
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


## /v1/users/premium-disclosure-settings
```json
{
    "Method": "GET",
    "Description": "Gets premium disclosure settings for the authenticated user",
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


## /v1/users/{userId}/premium-upsell-precheck
```json
{
    "Method": "GET",
    "Description": "Premium upsell precheck",
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
            "description": "User ID"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": ""
        }
    },
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


## /v1/users/{userId}/validate-membership-rcc
```json
{
    "Method": "GET",
    "Description": "Get if a user has a Premium membership for RCC only",
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
            "description": "User ID"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        }
    },
}
```
<hr>


## /v1/products
```json
{
    "Method": "GET",
    "Description": "Gets available PremiumFeatures Products available to the user",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "typeName",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        }
    },
}
```
<hr>


## /v1/users/{userId}/validate-membership
```json
{
    "Method": "GET",
    "Description": "Get if a user has a Premium membership",
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
            "description": "User ID"
        }
    },
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


## /v1/users/{userId}/subscriptions/metadata
```json
{
    "Method": "GET",
    "Description": "Gets metadata about a user's current subscription status",
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
            "description": "User ID"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for the premium features metadata endpoint",
                    "properties": {
                        "UserIsInPromotionNoCancelWindow": {
                            "type": "boolean"
                        },
                        "UserRenewalIsProcessing": {
                            "type": "boolean"
                        },
                        "GoogleSubscriptionRenewal": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "MembershipDuration": {
                            "type": "string"
                        },
                        "UserHasMultipleActiveSubscriptions": {
                            "type": "boolean"
                        },
                        "PremiumFeatureId": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "UserIsSubscribedToAccountProduct": {
                            "type": "boolean"
                        },
                        "UserHasGooglePlayStoreSubscription": {
                            "type": "boolean"
                        },
                        "Expiration": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "ComputerSubscriptionRenewal": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "MembershipName": {
                            "type": "string"
                        },
                        "GoogleCancellationDirectionsUrl": {
                            "type": "string"
                        },
                        "RobloxSupportUrl": {
                            "type": "string"
                        },
                        "SalesEarningsVisible": {
                            "type": "boolean"
                        },
                        "UserHasComputerSubscription": {
                            "type": "boolean"
                        },
                        "RobuxEarnedFromSales": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "StipendFrequency": {
                            "type": "string"
                        },
                        "AppleCancellationDirectionsUrl": {
                            "type": "string"
                        },
                        "PromotionNoCancelTerm": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "RobuxEarningsVisible": {
                            "type": "boolean"
                        },
                        "UpgradeProduct": {
                            "$ref": {
                                "properties": {
                                    "AccountAddOnTypeID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ShowcaseAllotmentTypeID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "IsRenewal": {
                                        "type": "boolean"
                                    },
                                    "ContentPrivilegeTypeID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "RobuxStipendQuantityTypeID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "AdvertisingSuppressionTypeID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ID": {
                                        "format": "int32",
                                        "readOnly": true,
                                        "type": "integer"
                                    },
                                    "RobuxStipendFrequencyTypeID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "RobuxCreditQuantityTypeID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "DurationTypeID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "CacheInfo": {
                                        "$ref": {
                                            "properties": {
                                                "EntityType": {
                                                    "readOnly": true,
                                                    "type": "string"
                                                },
                                                "Cacheability": {
                                                    "$ref": {
                                                        "properties": {
                                                            "IsNullCacheable": {
                                                                "type": "boolean"
                                                            },
                                                            "EntityIsCacheable": {
                                                                "type": "boolean"
                                                            },
                                                            "IDLookupsAreCaseSensitive": {
                                                                "type": "boolean"
                                                            },
                                                            "CountsAreCacheable": {
                                                                "type": "boolean"
                                                            },
                                                            "HasUnqualifiedCollections": {
                                                                "type": "boolean"
                                                            },
                                                            "IDLookupsAreCacheable": {
                                                                "type": "boolean"
                                                            },
                                                            "CollectionsAreCacheable": {
                                                                "type": "boolean"
                                                            }
                                                        },
                                                        "type": "object"
                                                    },
                                                    "readOnly": true
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "readOnly": true
                                    },
                                    "IsOutrageousBuildersClub": {
                                        "readOnly": true,
                                        "type": "boolean"
                                    },
                                    "GrantedBadgeListID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "IsAnySubscription": {
                                        "readOnly": true,
                                        "type": "boolean"
                                    },
                                    "Name": {
                                        "type": "string"
                                    },
                                    "GrantedItemListID": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "IsTurboBuildersClub": {
                                        "readOnly": true,
                                        "type": "boolean"
                                    },
                                    "GrantedAssetListID": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "IsAnyBuildersClub": {
                                        "readOnly": true,
                                        "type": "boolean"
                                    },
                                    "IsBuildersClub": {
                                        "readOnly": true,
                                        "type": "boolean"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "UserHasAppleAppStoreSubscription": {
                            "type": "boolean"
                        },
                        "AppleSubscriptionRenewal": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "NumRobuxText": {
                            "type": "string"
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


