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


