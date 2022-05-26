# <b>AdConfiguration Api v1</b>

## /v1/sponsored-games/run
```json
{
    "Method": "POST",
    "Description": "Runs the specified ad.",
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
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for running a sponsored-game Ad.",
                    "properties": {
                        "adId": {
                            "format": "int64",
                            "description": "The ID of the ad to run.",
                            "type": "integer"
                        },
                        "bid": {
                            "format": "int32",
                            "description": "The amount, in Robux, to bid.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "See {Roblox.AdConfiguration.Api.Models.Request.RunSponsoredGamesRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n8: Insufficient permission\r\n9: The game has not been approved.\r\n10: The bid is lower than minimum bid.\r\n11: This sponsorship is already running.\r\n12: Insufficient funds."
        },
        "400": {
            "description": "6: The request data format is incorrect."
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
            "description": "1: This feature is disabled.\r\n5: The user ads service is currently unavailable."
        }
    },
}
```
<hr>


## /v1/sponsored-games/create-ad/metadata
```json
{
    "Method": "GET",
    "Description": "To get the metadata for create a sponsored-game Ad",
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
            "description": "The universe Id to be sponsored"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for create sponsored-game metadata",
                    "properties": {
                        "areNativeAdsForPhoneEnabled": {
                            "description": "Whether NativeAds are enabled for mobile.",
                            "type": "boolean"
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "Id of the universe that is being sponsored.",
                            "type": "integer"
                        },
                        "areNativeAdsForDesktopEnabled": {
                            "description": "Whether NativeAds are enabled for desktop.",
                            "type": "boolean"
                        },
                        "areNativeAdsForConsoleEnabled": {
                            "description": "Whether NativeAds are enabled for console.",
                            "type": "boolean"
                        },
                        "areNativeAdsForTabletEnabled": {
                            "description": "Whether NativeAds are enabled for tablet.",
                            "type": "boolean"
                        },
                        "universeCreatorTargetId": {
                            "format": "int64",
                            "description": "Creator target id of the universe being sponsored.",
                            "type": "integer"
                        },
                        "universeCreatorType": {
                            "description": "Creator type of the universe being sponsored.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "6: The request data format is incorrect."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/sponsored-games/sponsored-games
```json
{
    "Method": "GET",
    "Description": "Retrieves a page of sponsored games.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "groupId",
            "format": "int32",
            "required": true,
            "description": "The group Id, can be null."
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "startRowIndex",
            "format": "int32",
            "description": "The start row index, default to 0.",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "count",
            "format": "int32",
            "description": "The maximum number of items to retrieve, default to 50.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for retrieving a page of sponsored-game Ads.",
                    "properties": {
                        "isErroneous": {
                            "description": "Whether an error has occured while performing the action.",
                            "type": "boolean"
                        },
                        "nextPageStartRowIndex": {
                            "format": "int32",
                            "description": "The next page start row index, if present.",
                            "type": "integer"
                        },
                        "sponsoredGames": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A model represents a sponsored-game Ad.",
                                    "properties": {
                                        "universeName": {
                                            "description": "The name of the universe.",
                                            "type": "string"
                                        },
                                        "totalBid": {
                                            "format": "int32",
                                            "description": "The total bid in Robux.",
                                            "type": "integer"
                                        },
                                        "targetDeviceType": {
                                            "enum": {
                                                "1": "Computer",
                                                "2": "Phone",
                                                "3": "Tablet",
                                                "4": "Console"
                                            },
                                            "description": "The target {Roblox.Platform.Devices.DeviceType}.",
                                            "type": "string"
                                        },
                                        "costPerImpressionEstimate": {
                                            "format": "double",
                                            "description": "The cost per impression estimate, if present.",
                                            "type": "number"
                                        },
                                        "adId": {
                                            "format": "int64",
                                            "description": "The id of the Ad.",
                                            "type": "integer"
                                        },
                                        "gameIconUrl": {
                                            "description": "The game icon url.",
                                            "type": "string"
                                        },
                                        "campaign": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "A model represents a sponsored-game Ad campaign.",
                                                "properties": {
                                                    "bid": {
                                                        "format": "int32",
                                                        "description": "The bid in Robux.",
                                                        "type": "integer"
                                                    },
                                                    "impressions": {
                                                        "format": "int32",
                                                        "description": "The number of impressions.",
                                                        "type": "integer"
                                                    },
                                                    "clicks": {
                                                        "format": "int32",
                                                        "description": "The number of clicks.",
                                                        "type": "integer"
                                                    },
                                                    "isRunning": {
                                                        "description": "Whether the campaign is running.",
                                                        "type": "boolean"
                                                    }
                                                }
                                            },
                                            "description": "The {Roblox.AdConfiguration.Api.Models.Response.SponsoredGameCampaignModel} of the Ad."
                                        },
                                        "universeRootPlaceId": {
                                            "format": "int64",
                                            "description": "The root place Id of the universe, if present.",
                                            "type": "integer"
                                        },
                                        "totalClicks": {
                                            "format": "int32",
                                            "description": "The total clicks.",
                                            "type": "integer"
                                        },
                                        "totalImpressions": {
                                            "format": "int32",
                                            "description": "The total impressions.",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "A collection of {Roblox.AdConfiguration.Api.Models.Response.SponsoredGameModel}."
                        },
                        "minimumBidAmount": {
                            "format": "int64",
                            "description": "The minimum bid amount in Robux.",
                            "type": "integer"
                        },
                        "creatorType": {
                            "enum": {
                                "1": "User",
                                "2": "Group"
                            },
                            "description": "The creator type.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "1: This feature is disabled."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/sponsored-games/create-ad
```json
{
    "Method": "POST",
    "Description": "Creates new native ads.",
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
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for creating a sponsored-game Ad.",
                    "properties": {
                        "targetDeviceTypes": {
                            "items": {
                                "type": "string",
                                "enum": {
                                    "1": "Computer",
                                    "2": "Phone",
                                    "3": "Tablet",
                                    "4": "Console"
                                }
                            },
                            "type": "array",
                            "description": "The {Roblox.Platform.Devices.DeviceType}s at which to target the ads. An ad will be created for each type."
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "The ID of the universe to create the ads for.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "{Roblox.AdConfiguration.Api.Models.Request.CreateSponsoredGamesRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n8: Insufficient permission\r\n9: The game has not been approved."
        },
        "400": {
            "description": "6: The request data format is incorrect."
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
            "description": "1: This feature is disabled.\r\n5: The user ads service is currently unavailable."
        }
    },
}
```
<hr>


## /v1/sponsored-games/stop
```json
{
    "Method": "POST",
    "Description": "Stops the specified ad.",
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
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model represents a request to stop an Ad campaign.",
                    "properties": {
                        "adId": {
                            "format": "int64",
                            "description": "The ID of the ad to stop.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "See {Roblox.AdConfiguration.Api.Models.Request.StopSponsoredGameRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n8: Insufficient permission"
        },
        "503": {
            "description": "1: This feature is disabled.\r\n5: The user ads service is currently unavailable."
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
        "404": {
            "description": "3: The sponsored game code is invalid\r\n4: The ad campaign is non-existent"
        }
    },
}
```
<hr>


# <b>AdConfiguration Api v2</b>

## /v2/sponsored-games/create
```json
{
    "Method": "POST",
    "Description": "Creates a new sponsored game ad with specified input parameters.",
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
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for creating a sponsored game",
                    "properties": {
                        "universeId": {
                            "format": "int64",
                            "description": "The target universe id",
                            "type": "integer"
                        },
                        "budgetInRobux": {
                            "format": "int64",
                            "description": "The budget in Robux",
                            "type": "integer"
                        },
                        "endDate": {
                            "format": "date-time",
                            "description": "The end date of the ad set",
                            "type": "string"
                        },
                        "adName": {
                            "description": "The name of the Ad",
                            "type": "string"
                        },
                        "bidAmountInRobux": {
                            "format": "int64",
                            "description": "The bid amount of the Ad in Robux",
                            "type": "integer"
                        },
                        "startDate": {
                            "format": "date-time",
                            "description": "The start date of the ad set",
                            "type": "string"
                        },
                        "targetGender": {
                            "enum": {
                                "1": "Undefined",
                                "2": "Male",
                                "3": "Female"
                            },
                            "description": "Targeting gender(s) of the ad set",
                            "type": "string"
                        },
                        "targetDeviceType": {
                            "enum": {
                                "1": "Undefined",
                                "2": "Computer",
                                "3": "Phone",
                                "4": "Tablet",
                                "5": "Console"
                            },
                            "description": "Targeting device type(s) of the ad set",
                            "type": "string"
                        },
                        "targetAgeBracket": {
                            "enum": {
                                "1": "Undefined",
                                "2": "AgeUnder13",
                                "3": "Age13OrOver"
                            },
                            "description": "Targeting age bracket(s) of the ad set",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.AdConfiguration.Api.CreateSponsoredGameV2Request}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n10: Insufficient permissions."
        },
        "400": {
            "description": "2: Daily budget is lower than minimum allowed.\r\n3: Total budget must be greater than 0.\r\n4: Ad name cannot be empty.\r\n5: Start date must not be a future date.\r\n6: End date must be a future date.\r\n7: Start date must be earlier than end date.\r\n8: Total budget does not match daily spend and number of days being scheduled\r\n9: Cannot load the universe for the specified universe id.\r\n11: Invalid target age bracket.\r\n12: Invalid target gender.\r\n13: Invalid target device type."
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
            "description": "1: This feature is disabled."
        }
    },
}
```
<hr>


## /v2/sponsored-games/universes
```json
{
    "Method": "GET",
    "Description": "Gets a list of universes for the authenticated user, or the given group, ordered by most recently created sponsored game ads.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "groupId",
            "format": "int64",
            "description": "The group id, if applicable.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for getting a list of recent-ads-ranked universes.",
                    "properties": {
                        "universes": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Represents a universe in API endpoint results.",
                                    "properties": {
                                        "id": {
                                            "format": "int64",
                                            "description": "The universe Id.",
                                            "type": "integer"
                                        },
                                        "name": {
                                            "description": "The name of the universe",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets a list of {Roblox.AdConfiguration.Api.Models.UniverseModel}."
                        }
                    }
                }
            }
        },
        "403": {
            "description": "10: Insufficient permissions."
        },
        "400": {
            "description": "19: Invalid group id."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v2/sponsored-games/stop
```json
{
    "Method": "POST",
    "Description": "To stop a sponsored-game ad (ad set) from running, initiated by a user.",
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
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A model represents a request to stop a sponsored game ad.",
                    "properties": {
                        "adSetId": {
                            "format": "int64",
                            "description": "Gets the ID of the ad set to stop.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "{Roblox.AdConfiguration.Api.Models.StopSponsoredGameV2Request}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n10: Insufficient permissions."
        },
        "400": {
            "description": "14: Invalid ad set id."
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
            "description": "1: This feature is disabled."
        }
    },
}
```
<hr>


## /v2/sponsored-games
```json
{
    "Method": "GET",
    "Description": "Gets a page of {Roblox.AdConfiguration.Api.SponsoredGameV2Model} with specified input parameters.",
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
            "description": "The universe id of the ad campaign."
        },
        "2": {
            "in": "query",
            "type": "boolean",
            "name": "includeReportingStats",
            "description": "Indicates whether to include reporting stats in the response.",
        },
        "3": {
            "in": "query",
            "type": "boolean",
            "name": "isArchived",
            "description": "Indicates whether to retrieve archived ads.",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "pageCursor",
            "description": "The cursor of the page to retrieve.",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for retrieving a page of {Roblox.AdConfiguration.Api.SponsoredGameV2Model}.",
                    "properties": {
                        "nextPageCursor": {
                            "description": "The cursor for retrieving the next page, if present.",
                            "type": "string"
                        },
                        "sponsoredGames": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A response model represents an Ad with complete information, including infos from its associated campaign and ad set",
                                    "properties": {
                                        "totalSpendInRobux": {
                                            "format": "int64",
                                            "description": "The total spend of the ad set in Robux",
                                            "type": "integer"
                                        },
                                        "budgetInRobux": {
                                            "format": "int64",
                                            "description": "The budget of the ad set in Robux",
                                            "type": "integer"
                                        },
                                        "creativeType": {
                                            "enum": {
                                                "1": "Undefined",
                                                "2": "Image"
                                            },
                                            "description": "The type of the creative associated with the Ad",
                                            "type": "string"
                                        },
                                        "creativeTargetId": {
                                            "format": "int64",
                                            "description": "The target id of the creative associated with the Ad",
                                            "type": "integer"
                                        },
                                        "targetDeviceType": {
                                            "enum": {
                                                "1": "Undefined",
                                                "2": "Computer",
                                                "3": "Phone",
                                                "4": "Tablet",
                                                "5": "Console"
                                            },
                                            "description": "The target device type of the ad set",
                                            "type": "string"
                                        },
                                        "creativeUrl": {
                                            "description": "The Url of the creative",
                                            "type": "string"
                                        },
                                        "startDate": {
                                            "format": "date-time",
                                            "description": "The start date of the ad set",
                                            "type": "string"
                                        },
                                        "totalConversions": {
                                            "format": "int64",
                                            "description": "The total number of conversions generated by the ad",
                                            "type": "integer"
                                        },
                                        "totalImpressions": {
                                            "format": "int64",
                                            "description": "The total number of impressions generated by the ad",
                                            "type": "integer"
                                        },
                                        "adSetStatus": {
                                            "enum": {
                                                "1": "Undefined",
                                                "2": "Draft",
                                                "3": "Scheduled",
                                                "4": "Running",
                                                "5": "Paused",
                                                "6": "Stopped",
                                                "7": "Completed"
                                            },
                                            "description": "The status of the ad set",
                                            "type": "string"
                                        },
                                        "bidAmountInRobux": {
                                            "format": "int64",
                                            "description": "The bid amount of the Ad in Robux",
                                            "type": "integer"
                                        },
                                        "totalClicks": {
                                            "format": "int64",
                                            "description": "The total number of clicks generated by the ad",
                                            "type": "integer"
                                        },
                                        "campaignTargetId": {
                                            "format": "int64",
                                            "description": "The target id of the campaign",
                                            "type": "integer"
                                        },
                                        "impressionConversions": {
                                            "format": "int64",
                                            "description": "The number of conversions by ad impression generated by the ad",
                                            "type": "integer"
                                        },
                                        "endDate": {
                                            "format": "date-time",
                                            "description": "The end date of the ad set",
                                            "type": "string"
                                        },
                                        "adSetId": {
                                            "format": "int64",
                                            "description": "The id of the ad set",
                                            "type": "integer"
                                        },
                                        "campaignTargetType": {
                                            "enum": {
                                                "1": "Undefined",
                                                "2": "Universe"
                                            },
                                            "description": "The target type of the campaign",
                                            "type": "string"
                                        },
                                        "adId": {
                                            "format": "int64",
                                            "description": "The id of the ad",
                                            "type": "integer"
                                        },
                                        "adStatus": {
                                            "enum": {
                                                "1": "Undefined",
                                                "2": "Draft",
                                                "3": "PendingApproval",
                                                "4": "Approved",
                                                "5": "Moderated"
                                            },
                                            "description": "The status of the ad",
                                            "type": "string"
                                        },
                                        "targetAgeBracket": {
                                            "enum": {
                                                "1": "Undefined",
                                                "2": "AgeUnder13",
                                                "3": "Age13OrOver"
                                            },
                                            "description": "The target age bracket of the ad set",
                                            "type": "string"
                                        },
                                        "targetGender": {
                                            "enum": {
                                                "1": "Undefined",
                                                "2": "Male",
                                                "3": "Female"
                                            },
                                            "description": "The target gender of the ad set",
                                            "type": "string"
                                        },
                                        "clickConversions": {
                                            "format": "int64",
                                            "description": "The number of conversions by ad click generated by the ad",
                                            "type": "integer"
                                        },
                                        "adName": {
                                            "description": "The name of the Ad",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "A collection of {Roblox.AdConfiguration.Api.SponsoredGameV2Model}."
                        },
                        "previousPageCursor": {
                            "description": "The cursor for retrieving the previous page, if present.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "1: This feature is disabled."
        },
        "400": {
            "description": "9: Cannot load the universe for the specified universe id.\r\n9: Cannot load the universe for the specified universe id."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


