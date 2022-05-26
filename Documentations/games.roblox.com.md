# <b>Games Api v1</b>

## /v1/games/{universeId}/favorites/count
```json
{
    "Method": "GET",
    "Description": "Get the favorites count of the a specific game",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The Id of the universe."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for favorited game count.",
                    "properties": {
                        "favoritesCount": {
                            "format": "int64",
                            "description": "Favorites count.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "3: The universe's root place is invalid."
        },
        "404": {
            "description": "2: The requested universe does not exist."
        }
    },
}
```
<hr>


## /v1/games/{universeId}/votes
```json
{
    "Method": "GET",
    "Description": "Get the game vote status",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the universe we get vote status from."
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "2: The universe's root place is invalid.\r\n3: The asset is not voteable."
        },
        "200": {
            "description": "Get the game vote status successfully.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for getting the game vote",
                    "properties": {
                        "id": {
                            "format": "int64",
                            "description": "The game universe id",
                            "type": "integer"
                        },
                        "upVotes": {
                            "format": "int64",
                            "description": "The game up votes",
                            "type": "integer"
                        },
                        "downVotes": {
                            "format": "int64",
                            "description": "The game down votes",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: The requested universe does not exist."
        },
        "429": {
            "description": "10: Internal service busy. Please try again later."
        }
    },
}
```
<hr>


## /v1/games/game-thumbnails
```json
{
    "Method": "GET",
    "Description": "Gets a list of game thumbnails",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "required": true,
            "description": "",
            "name": "imageTokens"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "height",
            "format": "int32",
            "description": "",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "width",
            "format": "int32",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "Thumbnail response model.",
                        "properties": {
                            "universeId": {
                                "format": "int64",
                                "description": "UniverseId",
                                "type": "integer"
                            },
                            "cdnUrl": {
                                "description": "CdnUrl",
                                "type": "string"
                            },
                            "retryToken": {
                                "description": "RetryToken",
                                "type": "string"
                            },
                            "url": {
                                "description": "Url",
                                "type": "string"
                            },
                            "placeId": {
                                "format": "int64",
                                "description": "PlaceId",
                                "type": "integer"
                            },
                            "final": {
                                "description": "Final",
                                "type": "boolean"
                            }
                        }
                    }
                },
                "type": "array"
            }
        },
        "404": {
            "description": "10: This endpoint is deprecated"
        }
    },
}
```
<hr>


## /v1/games/vip-servers/{universeId}
```json
{
    "Method": "POST",
    "Description": "Create VIP server for a game",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the universe."
        },
        "2": {
            "in": "body",
            "name": "requestBody",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "An create request for a vip server",
                    "properties": {
                        "expectedPrice": {
                            "format": "int64",
                            "description": "the expected price of the vip server",
                            "type": "integer"
                        },
                        "name": {
                            "description": "The name new vip server will be",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "500": {
            "description": "16: We are having a problem completing your purchase. Please try again in a few minutes."
        },
        "400": {
            "description": "15: The price for purchasing this private server has changed. Please refresh the page and try again."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "ping": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "ownerUserId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "id": {
                            "format": "uuid",
                            "example": "00000000-0000-0000-0000-000000000000",
                            "type": "string"
                        },
                        "fps": {
                            "type": "number",
                            "format": "double"
                        },
                        "name": {
                            "type": "string"
                        },
                        "accessCode": {
                            "format": "uuid",
                            "example": "00000000-0000-0000-0000-000000000000",
                            "type": "string"
                        },
                        "vipServerId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "maxPlayers": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "playing": {
                            "type": "integer",
                            "format": "int32"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "404": {
            "description": "4: The universe does not exist."
        },
        "403": {
            "description": "0: Token Validation Failed"
        }
    },
}
```
<hr>


## /v1/games/multiget-place-details
```json
{
    "Method": "GET",
    "Description": "Get place details",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "List of placeId to uniquely Identify a place",
            "name": "placeIds"
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "Response model for a place.",
                        "properties": {
                            "reasonProhibited": {
                                "description": "Reason prohibited",
                                "type": "string"
                            },
                            "universeId": {
                                "format": "int64",
                                "description": "Universe id",
                                "type": "integer"
                            },
                            "description": {
                                "description": "Place description",
                                "type": "string"
                            },
                            "builder": {
                                "description": "Creator name",
                                "type": "string"
                            },
                            "placeId": {
                                "format": "int64",
                                "description": "Place Id",
                                "type": "integer"
                            },
                            "isPlayable": {
                                "description": "Is playable",
                                "type": "boolean"
                            },
                            "name": {
                                "description": "Place name",
                                "type": "string"
                            },
                            "price": {
                                "format": "int64",
                                "description": "Price",
                                "type": "integer"
                            },
                            "universeRootPlaceId": {
                                "format": "int64",
                                "description": "UniverseRootPlaceId",
                                "type": "integer"
                            },
                            "url": {
                                "description": "Url",
                                "type": "string"
                            },
                            "imageToken": {
                                "description": "Place image token",
                                "type": "string"
                            },
                            "builderId": {
                                "format": "int64",
                                "description": "Creator Id",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "array"
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/vip-server/can-invite/{userId}
```json
{
    "Method": "GET",
    "Description": "Determines if a user by id is allowed to receive a VIP Server invite from the authenticated user.",
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
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for VIP server can-invite user.",
                    "properties": {
                        "canInvite": {
                            "description": "Sufficient permissions to invite user",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "19: The user is does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/games/list-spotlight
```json
{
    "Method": "GET",
    "Description": "Gets games that the client should spotlight.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "Get the spotlight games successfully.",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for a spotlight game.",
                                    "properties": {
                                        "gameInfo": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Response model for games.",
                                                "properties": {
                                                    "gameDescription": {
                                                        "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                                        "type": "string"
                                                    },
                                                    "creatorId": {
                                                        "format": "int64",
                                                        "description": "Creator Id",
                                                        "type": "integer"
                                                    },
                                                    "playerCount": {
                                                        "format": "int32",
                                                        "description": "Player count",
                                                        "type": "integer"
                                                    },
                                                    "analyticsIdentifier": {
                                                        "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                                        "type": "string"
                                                    },
                                                    "totalDownVotes": {
                                                        "format": "int64",
                                                        "description": "Total down votes",
                                                        "type": "integer"
                                                    },
                                                    "placeId": {
                                                        "format": "int64",
                                                        "description": "Place Id",
                                                        "type": "integer"
                                                    },
                                                    "price": {
                                                        "format": "int64",
                                                        "description": "The game paid access price",
                                                        "type": "integer"
                                                    },
                                                    "imageToken": {
                                                        "description": "Place image token",
                                                        "type": "string"
                                                    },
                                                    "nativeAdData": {
                                                        "description": "Native ad data",
                                                        "type": "string"
                                                    },
                                                    "isSponsored": {
                                                        "description": "Is sponsored",
                                                        "type": "boolean"
                                                    },
                                                    "name": {
                                                        "description": "Game name",
                                                        "type": "string"
                                                    },
                                                    "totalUpVotes": {
                                                        "format": "int64",
                                                        "description": "Total up votes",
                                                        "type": "integer"
                                                    },
                                                    "isShowSponsoredLabel": {
                                                        "description": "Show the sponsored label",
                                                        "type": "boolean"
                                                    },
                                                    "universeId": {
                                                        "format": "int64",
                                                        "description": "Universe id",
                                                        "type": "integer"
                                                    },
                                                    "creatorName": {
                                                        "description": "Creator name",
                                                        "type": "string"
                                                    },
                                                    "creatorType": {
                                                        "description": "Creator type",
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "Game response model for the game itself."
                                        },
                                        "spotlightTypeData": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Parent class to derive custom data for each spotlight type.",
                                                "properties": {
                                                }
                                            },
                                            "description": "Custom data that the spotlight type can return, that the client can interpret."
                                        },
                                        "spotlightType": {
                                            "description": "The spotlight game type; reason the game has been spotlighted.",
                                            "type": "string"
                                        },
                                        "spotlightActionText": {
                                            "description": "Localized text to display on the client for this spotlight game (call to action).",
                                            "type": "string"
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
        "500": {
            "description": "0: Compliance Context service is unavailable."
        }
    },
}
```
<hr>


## /v1/vip-servers/{id}/permissions
```json
{
    "Method": "PATCH",
    "Description": "Update friend/clan access and allowed friends/clan list",
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
            "name": "id",
            "format": "int64",
            "required": true,
            "description": "The VIP Server ID"
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for updating permissions for a VIP server.",
                    "properties": {
                        "usersToRemove": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "Users to remove"
                        },
                        "friendsAllowed": {
                            "description": "Friend access",
                            "type": "boolean"
                        },
                        "usersToAdd": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "Users to add"
                        },
                        "enemyClanId": {
                            "format": "int32",
                            "description": "EnemyClanId",
                            "type": "integer"
                        },
                        "clanAllowed": {
                            "description": "Clan access",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The {Roblox.Games.Api.VipServerUpdatePermissionsRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You are not the owner of this private server."
        },
        "400": {
            "description": "6: You cannot add so many players to the private server's invite list.\r\n8: The creator of this game has disabled private servers for this game.\r\n12: The game must not be Friends Only to allow private servers.\r\n28: You may only add or remove valid players to your private server's invite list.\r\n29: You may only add or remove players when your private server is active."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for VIP server permissions.",
                    "properties": {
                        "friendsAllowed": {
                            "description": "Friend access",
                            "type": "boolean"
                        },
                        "enemyClanId": {
                            "format": "int64",
                            "description": "EnemyClanId",
                            "type": "integer"
                        },
                        "users": {
                            "items": {
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
                            "type": "array",
                            "description": "Users"
                        },
                        "clanAllowed": {
                            "description": "Clan access",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: The private server is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/games/{universeId}/votes/user
```json
{
    "Method": "GET",
    "Description": "Get the user's vote status for a game",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the universe we get user vote status from."
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "2: The universe's root place is invalid.\r\n3: The asset is not voteable."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "Get the user's vote status for a game successfully.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for getting the user vote status for a game",
                    "properties": {
                        "canVote": {
                            "description": "Whether the user can vote the game",
                            "type": "boolean"
                        },
                        "userVote": {
                            "description": "The user's vote status for the game",
                            "type": "boolean"
                        },
                        "reasonForNotVoteable": {
                            "description": "The reason why the user can't vote",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: The requested universe does not exist."
        },
        "429": {
            "description": "10: Internal service busy. Please try again later."
        }
    },
}
```
<hr>


## /v1/games/{universeId}/social-links/list
```json
{
    "Method": "GET",
    "Description": "Get social link data associated with a game",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The Id of the game"
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
                                    "description": "A social link for a game",
                                    "properties": {
                                        "id": {
                                            "format": "int64",
                                            "description": "The id of the social link",
                                            "type": "integer"
                                        },
                                        "url": {
                                            "description": "The url of the social link",
                                            "type": "string"
                                        },
                                        "title": {
                                            "description": "The title given to the social link",
                                            "type": "string"
                                        },
                                        "type": {
                                            "enum": {
                                                "1": "Facebook",
                                                "2": "Twitter",
                                                "3": "YouTube",
                                                "4": "Twitch",
                                                "5": "GooglePlus",
                                                "6": "Discord",
                                                "7": "RobloxGroup"
                                            },
                                            "description": "The type (Facebook/Twitter) of the social link.",
                                            "type": "string"
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
            "description": "3: Only users who are over twelve years of age may view social links."
        },
        "503": {
            "description": "2: Social links cannot be processed as this time."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/games/game-thumbnail
```json
{
    "Method": "GET",
    "Description": "Get a single game thumbnail",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "imageToken",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "height",
            "format": "int32",
            "description": "",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "width",
            "format": "int32",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "404": {
            "description": "10: This endpoint is deprecated"
        }
    },
}
```
<hr>


## /v1/games/votes
```json
{
    "Method": "GET",
    "Description": "Gets a list of universe vote status",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "A list of universe Ids. Cannot exceed a maximum of 100 IDs.",
            "name": "universeIds"
        }
    },
    "Responses": {
        "200": {
            "description": "Get the vote status successfully.",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for getting the game vote",
                                    "properties": {
                                        "id": {
                                            "format": "int64",
                                            "description": "The game universe id",
                                            "type": "integer"
                                        },
                                        "upVotes": {
                                            "format": "int64",
                                            "description": "The game up votes",
                                            "type": "integer"
                                        },
                                        "downVotes": {
                                            "format": "int64",
                                            "description": "The game down votes",
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
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "3: The asset is not voteable.\r\n8: No universe IDs were specified.\r\n9: Too many universe IDs were requested."
        },
        "429": {
            "description": "10: Internal service busy. Please try again later."
        }
    },
}
```
<hr>


## /v1/games/{placeId}/servers/{serverType}
```json
{
    "Method": "GET",
    "Description": "Get the game server list",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The Id of the place we are geting the server list for."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "serverType",
            "enum": {
                "1": "Public",
                "2": "Friend",
                "3": "VIP"
            },
            "required": true,
            "description": "The type of the server we geting the server list for."
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
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
        }
    },
    "Responses": {
        "200": {
            "description": "Get the game server list successfully.",
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
                                        "ping": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "ownerUserId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "id": {
                                            "format": "uuid",
                                            "example": "00000000-0000-0000-0000-000000000000",
                                            "type": "string"
                                        },
                                        "fps": {
                                            "type": "number",
                                            "format": "double"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "accessCode": {
                                            "format": "uuid",
                                            "example": "00000000-0000-0000-0000-000000000000",
                                            "type": "string"
                                        },
                                        "vipServerId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "maxPlayers": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "playing": {
                                            "type": "integer",
                                            "format": "int32"
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
            "description": "1: The place is invalid.\r\n6: The server type is invalid.\r\n7: Guest users are not allowed."
        },
        "404": {
            "description": "1: The place is invalid."
        }
    },
}
```
<hr>


## /v1/games/sorts
```json
{
    "Method": "GET",
    "Description": "Gets an ordered list of all sorts",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "model.gameSortsContext",
            "enum": {
                "1": "GamesDefaultSorts",
                "2": "GamesAllSorts",
                "3": "HomeSorts",
                "4": "ChatSorts",
                "5": "UnifiedHomeSorts",
                "6": "GamesPageAbTestSorts1",
                "7": "GamesPageAbTestSorts2"
            },
            "description": "Context to determine which game sorts are being requested.",
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a collection of game sorts",
                    "properties": {
                        "genreFilters": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Genre filter response model.",
                                    "properties": {
                                        "tokenExpiryInSeconds": {
                                            "format": "double",
                                            "description": "TokenExpiryInSeconds",
                                            "type": "number"
                                        },
                                        "token": {
                                            "description": "Token",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Genre display name",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Genre filters"
                        },
                        "sorts": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for a game sort.",
                                    "properties": {
                                        "contextUniverseId": {
                                            "format": "int64",
                                            "description": "ContextUniverseId",
                                            "type": "integer"
                                        },
                                        "isDefaultSort": {
                                            "description": "Is in the default sorts",
                                            "type": "boolean"
                                        },
                                        "tokenExpiryInSeconds": {
                                            "format": "double",
                                            "description": "TokenExpiryInSeconds",
                                            "type": "number"
                                        },
                                        "numberOfGames": {
                                            "format": "int32",
                                            "description": "Number of games",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "Game sort display name",
                                            "type": "string"
                                        },
                                        "gameSetTargetId": {
                                            "format": "int64",
                                            "description": "Extra id used by some Game Sets",
                                            "type": "integer"
                                        },
                                        "timeOptionsAvailable": {
                                            "description": "Time options available",
                                            "type": "boolean"
                                        },
                                        "token": {
                                            "description": "Token",
                                            "type": "string"
                                        },
                                        "numberOfRows": {
                                            "format": "int32",
                                            "description": "Number of rows to display on web only",
                                            "type": "integer"
                                        },
                                        "contextCountryRegionId": {
                                            "format": "int32",
                                            "description": "ContextCountryRegionId",
                                            "type": "integer"
                                        },
                                        "name": {
                                            "description": "Game sort internal name",
                                            "type": "string"
                                        },
                                        "genreOptionsAvailable": {
                                            "description": "Genre options available",
                                            "type": "boolean"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "GameSort response models"
                        },
                        "gameFilters": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Game filter response model.",
                                    "properties": {
                                        "tokenExpiryInSeconds": {
                                            "format": "int32",
                                            "description": "TokenExpiryInSeconds",
                                            "type": "integer"
                                        },
                                        "token": {
                                            "description": "Token",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Filter name",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Game filters"
                        },
                        "timeFilters": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for time filter.",
                                    "properties": {
                                        "tokenExpiryInSeconds": {
                                            "format": "double",
                                            "description": "TokenExpiryInSeconds",
                                            "type": "number"
                                        },
                                        "token": {
                                            "description": "Token",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Filter name",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Time filters"
                        },
                        "gameSortStyle": {
                            "description": "GameSortStyle",
                            "type": "string"
                        },
                        "pageContext": {
                            "$ref": {
                                "type": "object",
                                "description": "This class contains context information about a page load for the user.",
                                "properties": {
                                    "pageId": {
                                        "type": "string",
                                        "format": "uuid",
                                        "description": "Id to identify the page as shown to the user.",
                                        "example": "00000000-0000-0000-0000-000000000000"
                                    },
                                    "isSeeAllPage": {
                                        "description": "SortPosition",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "PageContext"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/games/{universeId}/icon
```json
{
    "Method": "GET",
    "Description": "Get the game icon",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the universe to get the icon for."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for getting the game icon.",
                    "properties": {
                        "imageId": {
                            "format": "int64",
                            "description": "The icon image id or null - if the default icon is used.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "3: The universe's root place is invalid."
        },
        "404": {
            "description": "2: The requested universe does not exist."
        }
    },
}
```
<hr>


## /v1/games/{universeId}/media
```json
{
    "Method": "GET",
    "Description": "Get the game media data",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the universe we get media data from."
        }
    },
    "Responses": {
        "200": {
            "description": "Get the game media data successfully.",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for getting the game media item",
                                    "properties": {
                                        "assetTypeId": {
                                            "format": "int64",
                                            "description": "The media item type id",
                                            "type": "integer"
                                        },
                                        "videoTitle": {
                                            "description": "The video title for video items.",
                                            "type": "string"
                                        },
                                        "videoHash": {
                                            "description": "The media item video hash",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The media item id.",
                                            "type": "integer"
                                        },
                                        "approved": {
                                            "description": "The media item is approved or not",
                                            "type": "boolean"
                                        },
                                        "assetType": {
                                            "description": "The media item type, Image or YouTubeVideo",
                                            "type": "string"
                                        },
                                        "imageId": {
                                            "format": "int64",
                                            "description": "The media item image id",
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
        "400": {
            "description": "3: The universe's root place is invalid."
        },
        "404": {
            "description": "2: The requested universe does not exist."
        }
    },
}
```
<hr>


## /v1/games/games-product-info
```json
{
    "Method": "GET",
    "Description": "Gets a list of games' product info, used to purchase a game",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "A list of universe Ids. Cannot exceed a maximum of 100 IDs.",
            "name": "universeIds"
        }
    },
    "Responses": {
        "200": {
            "description": "Get the games product info successfully. Invalid games do not get returned.",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for getting the game product information",
                                    "properties": {
                                        "universeId": {
                                            "format": "int64",
                                            "description": "The game universe id",
                                            "type": "integer"
                                        },
                                        "isForSale": {
                                            "description": "The game purchasability",
                                            "type": "boolean"
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The game price",
                                            "type": "integer"
                                        },
                                        "sellerId": {
                                            "format": "int64",
                                            "description": "The game seller id\r\nUser ID for users, Agent ID for groups",
                                            "type": "integer"
                                        },
                                        "productId": {
                                            "format": "int64",
                                            "description": "The game product id",
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
        "400": {
            "description": "8: No universe IDs were specified.\r\n9: Too many universe IDs were requested."
        }
    },
}
```
<hr>


## /v1/games/{universeId}/game-passes
```json
{
    "Method": "GET",
    "Description": "Get the game's game passes",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the universe."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
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
            "description": "Get the game's game passes successfully.",
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
                                    "description": "Response model for getting game passes",
                                    "properties": {
                                        "name": {
                                            "description": "The game pass name",
                                            "type": "string"
                                        },
                                        "productId": {
                                            "format": "int64",
                                            "description": "The game pass product id",
                                            "type": "integer"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The game pass id",
                                            "type": "integer"
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The game pass price",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "The game pass display name",
                                            "type": "string"
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
            "description": "2: The universe's root place is invalid."
        },
        "404": {
            "description": "1: The requested universe does not exist."
        }
    },
}
```
<hr>


## /v1/games
```json
{
    "Method": "GET",
    "Description": "Gets a list of games' detail",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "A list of universe Ids. Cannot exceed a maximum of 100 IDs.",
            "name": "universeIds"
        }
    },
    "Responses": {
        "200": {
            "description": "Get the game details successfully.",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for getting the game detail",
                                    "properties": {
                                        "allowedGearCategories": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array",
                                            "description": "The game allowed gear categoris"
                                        },
                                        "description": {
                                            "description": "The game description",
                                            "type": "string"
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The game paid access price",
                                            "type": "integer"
                                        },
                                        "genre": {
                                            "description": "The game genre display name",
                                            "type": "string"
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "The game updated time",
                                            "type": "string"
                                        },
                                        "playing": {
                                            "format": "int64",
                                            "description": "Current player count of the game",
                                            "type": "integer"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "The game created time",
                                            "type": "string"
                                        },
                                        "createVipServersAllowed": {
                                            "description": "Gets or sets the flag to indicate whether the create vip servers button should be allowed in game details page",
                                            "type": "boolean"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The game universe id",
                                            "type": "integer"
                                        },
                                        "allowedGearGenres": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array",
                                            "description": "The game allowed gear genres"
                                        },
                                        "universeAvatarType": {
                                            "enum": {
                                                "1": "MorphToR6",
                                                "2": "PlayerChoice",
                                                "3": "MorphToR15"
                                            },
                                            "description": "Avatar type. Possible values are MorphToR6, MorphToR15, and PlayerChoice",
                                            "type": "string"
                                        },
                                        "gameRating": {
                                            "$ref": {
                                                "properties": {
                                                    "RatingProvider": {
                                                        "type": "string"
                                                    },
                                                    "RatingInformation": {
                                                        "items": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "RatingValue": {
                                                                        "type": "string"
                                                                    },
                                                                    "RatingValueDescription": {
                                                                        "type": "string"
                                                                    },
                                                                    "RatingDescriptors": {
                                                                        "items": {
                                                                            "type": "string"
                                                                        },
                                                                        "type": "array",
                                                                        "readOnly": true
                                                                    },
                                                                    "ImageUrl": {
                                                                        "type": "string"
                                                                    },
                                                                    "InteractiveElements": {
                                                                        "items": {
                                                                            "type": "string"
                                                                        },
                                                                        "type": "array",
                                                                        "readOnly": true
                                                                    },
                                                                    "MetainfoValues": {
                                                                        "items": {
                                                                            "type": "string",
                                                                            "enum": {
                                                                                "1": "Invalid",
                                                                                "2": "HasLootBoxes",
                                                                                "3": "HasInGameTrading",
                                                                                "4": "IsUsingLootBoxApi",
                                                                                "5": "IsUsingInGameTradingApi",
                                                                                "6": "HasAllowedExternalLinkReferences",
                                                                                "7": "IsUsingAllowedExternalLinkReferencesApi"
                                                                            }
                                                                        },
                                                                        "type": "array",
                                                                        "readOnly": true
                                                                    }
                                                                },
                                                                "type": "object"
                                                            }
                                                        },
                                                        "type": "array",
                                                        "readOnly": true
                                                    },
                                                    "RatingProviderUrl": {
                                                        "type": "string"
                                                    },
                                                    "RatingCountryCode": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "Game Rating structure"
                                        },
                                        "name": {
                                            "description": "The game name",
                                            "type": "string"
                                        },
                                        "visits": {
                                            "format": "int64",
                                            "description": "The total visits to the game",
                                            "type": "integer"
                                        },
                                        "creator": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Response model for getting the game creator",
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "description": "The game creator id",
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "description": "The game creator type",
                                                        "type": "string"
                                                    },
                                                    "name": {
                                                        "description": "The game creator name",
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The game creator info"
                                        },
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "The game root place id",
                                            "type": "integer"
                                        },
                                        "studioAccessToApisAllowed": {
                                            "description": "The setting of IsStudioAccessToApisAllowed of the universe",
                                            "type": "boolean"
                                        },
                                        "maxPlayers": {
                                            "format": "int32",
                                            "description": "The game max players",
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
        "400": {
            "description": "8: No universe IDs were specified.\r\n9: Too many universe IDs were requested."
        }
    },
}
```
<hr>


## /v1/games/{universeId}/user-votes
```json
{
    "Method": "PATCH",
    "Description": "Set the user's vote for a game",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the universe."
        },
        "2": {
            "in": "body",
            "name": "requestBody",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request for set user's vote for a game",
                    "properties": {
                        "vote": {
                            "description": "The vote to set",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The request body."
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred."
        },
        "400": {
            "description": "2: The universe's root place is invalid.\r\n3: The asset is not voteable.\r\n4: The requested vote is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "Set the user's vote for the game successfully.",
            "schema": {
                "$ref": {
                    "properties": {
                    },
                    "type": "object"
                }
            }
        },
        "404": {
            "description": "1: The requested universe does not exist."
        },
        "429": {
            "description": "5: Too many attempts to vote. Please try again later.\r\n10: Internal service busy. Please try again later."
        },
        "403": {
            "description": "0: Token Validation Failed\r\n6: The user needs to play the game before vote.\r\n7: The user needs additional permission to vote."
        }
    },
}
```
<hr>


## /v1/games/places/{placeId}/metadata
```json
{
    "Method": "POST",
    "Description": "Used by the GameServer to set a place's metadata.",
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
            "name": "placeId",
            "format": "int64",
            "required": true,
            "description": "The Id of the place we are setting the metadata for."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for setting metadata",
                    "properties": {
                        "filteringEnabled": {
                            "description": "How many points to award to the user.",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "An {Roblox.Games.Api.ReportPlaceMetadataRequest}."
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
        "404": {
            "description": "1: The place is invalid."
        }
    },
}
```
<hr>


## /v1/games/recommendations/algorithm/{algorithmName}
```json
{
    "Method": "GET",
    "Description": "Get games recommendations",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "algorithmName",
            "required": true,
            "description": "The algorithm name of recommendations"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "model.paginationKey",
            "description": "The key of a page, which includes the start row index and all other necessary information to query the data.\r\nThis parameter is usually not needed for the first page.",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "model.maxRows",
            "format": "int32",
            "description": "The requested number of rows.",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "name": "model.isTruncatedResultsEnabled",
            "description": "Truncated Results",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Game recommendations response model.",
                    "properties": {
                        "games": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for games.",
                                    "properties": {
                                        "gameDescription": {
                                            "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                            "type": "string"
                                        },
                                        "creatorId": {
                                            "format": "int64",
                                            "description": "Creator Id",
                                            "type": "integer"
                                        },
                                        "playerCount": {
                                            "format": "int32",
                                            "description": "Player count",
                                            "type": "integer"
                                        },
                                        "analyticsIdentifier": {
                                            "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                            "type": "string"
                                        },
                                        "totalDownVotes": {
                                            "format": "int64",
                                            "description": "Total down votes",
                                            "type": "integer"
                                        },
                                        "placeId": {
                                            "format": "int64",
                                            "description": "Place Id",
                                            "type": "integer"
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The game paid access price",
                                            "type": "integer"
                                        },
                                        "imageToken": {
                                            "description": "Place image token",
                                            "type": "string"
                                        },
                                        "nativeAdData": {
                                            "description": "Native ad data",
                                            "type": "string"
                                        },
                                        "isSponsored": {
                                            "description": "Is sponsored",
                                            "type": "boolean"
                                        },
                                        "name": {
                                            "description": "Game name",
                                            "type": "string"
                                        },
                                        "totalUpVotes": {
                                            "format": "int64",
                                            "description": "Total up votes",
                                            "type": "integer"
                                        },
                                        "isShowSponsoredLabel": {
                                            "description": "Show the sponsored label",
                                            "type": "boolean"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "Universe id",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "Creator name",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "description": "Creator type",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The recommended games."
                        },
                        "nextPaginationKey": {
                            "description": "The pagination key for next page query.\r\nIt will be null if there is no more data.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The pagination key is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/games/recommendations/game/{universeId}
```json
{
    "Method": "GET",
    "Description": "Get games recommendations based on a given universe",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe to base recommendations on"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "model.paginationKey",
            "description": "The key of a page, which includes the start row index and all other necessary information to query the data.\r\nThis parameter is usually not needed for the first page.",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "model.maxRows",
            "format": "int32",
            "description": "The requested number of rows.",
        },
        "4": {
            "in": "query",
            "type": "boolean",
            "name": "model.isTruncatedResultsEnabled",
            "description": "Truncated Results",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Game recommendations response model.",
                    "properties": {
                        "games": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for games.",
                                    "properties": {
                                        "gameDescription": {
                                            "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                            "type": "string"
                                        },
                                        "creatorId": {
                                            "format": "int64",
                                            "description": "Creator Id",
                                            "type": "integer"
                                        },
                                        "playerCount": {
                                            "format": "int32",
                                            "description": "Player count",
                                            "type": "integer"
                                        },
                                        "analyticsIdentifier": {
                                            "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                            "type": "string"
                                        },
                                        "totalDownVotes": {
                                            "format": "int64",
                                            "description": "Total down votes",
                                            "type": "integer"
                                        },
                                        "placeId": {
                                            "format": "int64",
                                            "description": "Place Id",
                                            "type": "integer"
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The game paid access price",
                                            "type": "integer"
                                        },
                                        "imageToken": {
                                            "description": "Place image token",
                                            "type": "string"
                                        },
                                        "nativeAdData": {
                                            "description": "Native ad data",
                                            "type": "string"
                                        },
                                        "isSponsored": {
                                            "description": "Is sponsored",
                                            "type": "boolean"
                                        },
                                        "name": {
                                            "description": "Game name",
                                            "type": "string"
                                        },
                                        "totalUpVotes": {
                                            "format": "int64",
                                            "description": "Total up votes",
                                            "type": "integer"
                                        },
                                        "isShowSponsoredLabel": {
                                            "description": "Show the sponsored label",
                                            "type": "boolean"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "Universe id",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "Creator name",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "description": "Creator type",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The recommended games."
                        },
                        "nextPaginationKey": {
                            "description": "The pagination key for next page query.\r\nIt will be null if there is no more data.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The pagination key is invalid."
        },
        "404": {
            "description": "2: The requested universe does not exist."
        }
    },
}
```
<hr>


## /v1/games/list
```json
{
    "Method": "GET",
    "Description": "Gets a list of games",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "model.sortToken",
            "description": "Sort token.",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "model.gameFilter",
            "description": "Game filter.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "model.timeFilter",
            "description": "Time filter.",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "model.genreFilter",
            "description": "Genre filter.",
        },
        "5": {
            "in": "query",
            "type": "integer",
            "name": "model.exclusiveStartId",
            "format": "int64",
            "description": "Id to start getting entities.",
        },
        "6": {
            "in": "query",
            "type": "integer",
            "name": "model.sortOrder",
            "format": "int32",
            "description": "Sort order.",
        },
        "7": {
            "in": "query",
            "type": "integer",
            "name": "model.gameSetTargetId",
            "format": "int64",
            "description": "Extra id needed for specific Game Sets.",
        },
        "8": {
            "in": "query",
            "type": "string",
            "name": "model.keyword",
            "description": "Keyword",
        },
        "9": {
            "in": "query",
            "type": "integer",
            "name": "model.startRows",
            "format": "int32",
            "description": "StartRows",
        },
        "10": {
            "in": "query",
            "type": "integer",
            "name": "model.maxRows",
            "format": "int32",
            "description": "MaxRows",
        },
        "11": {
            "in": "query",
            "type": "integer",
            "name": "model.contextCountryRegionId",
            "format": "int32",
            "description": "ContextCountryRegionId",
        },
        "12": {
            "in": "query",
            "type": "integer",
            "name": "model.contextUniverseId",
            "format": "int64",
            "description": "ContextUniverseId",
        },
        "13": {
            "in": "query",
            "type": "string",
            "name": "model.pageContext.pageId",
            "description": "Id to identify the page as shown to the user.",
        },
        "14": {
            "in": "query",
            "type": "boolean",
            "name": "model.pageContext.isSeeAllPage",
            "description": "SortPosition",
        },
        "15": {
            "in": "query",
            "type": "integer",
            "name": "model.sortPosition",
            "format": "int32",
            "description": "SortPosition",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for games search",
                    "properties": {
                        "relatedGames": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for games.",
                                    "properties": {
                                        "gameDescription": {
                                            "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                            "type": "string"
                                        },
                                        "creatorId": {
                                            "format": "int64",
                                            "description": "Creator Id",
                                            "type": "integer"
                                        },
                                        "playerCount": {
                                            "format": "int32",
                                            "description": "Player count",
                                            "type": "integer"
                                        },
                                        "analyticsIdentifier": {
                                            "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                            "type": "string"
                                        },
                                        "totalDownVotes": {
                                            "format": "int64",
                                            "description": "Total down votes",
                                            "type": "integer"
                                        },
                                        "placeId": {
                                            "format": "int64",
                                            "description": "Place Id",
                                            "type": "integer"
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The game paid access price",
                                            "type": "integer"
                                        },
                                        "imageToken": {
                                            "description": "Place image token",
                                            "type": "string"
                                        },
                                        "nativeAdData": {
                                            "description": "Native ad data",
                                            "type": "string"
                                        },
                                        "isSponsored": {
                                            "description": "Is sponsored",
                                            "type": "boolean"
                                        },
                                        "name": {
                                            "description": "Game name",
                                            "type": "string"
                                        },
                                        "totalUpVotes": {
                                            "format": "int64",
                                            "description": "Total up votes",
                                            "type": "integer"
                                        },
                                        "isShowSponsoredLabel": {
                                            "description": "Show the sponsored label",
                                            "type": "boolean"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "Universe id",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "Creator name",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "description": "Creator type",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Related Games"
                        },
                        "suggestionAlgorithm": {
                            "description": "Algorithm used for game search suggestion (used for sending events in clients)",
                            "type": "string"
                        },
                        "suggestedKeyword": {
                            "description": "SuggestedKeyword",
                            "type": "string"
                        },
                        "algorithm": {
                            "description": "Algorithm used for game search (Elastic Search field, used for sending events in clients)",
                            "type": "string"
                        },
                        "algorithmQueryType": {
                            "description": "Query type for game search (Elastic search field,  used for sending events in clients)",
                            "type": "string"
                        },
                        "games": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response model for games.",
                                    "properties": {
                                        "gameDescription": {
                                            "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                            "type": "string"
                                        },
                                        "creatorId": {
                                            "format": "int64",
                                            "description": "Creator Id",
                                            "type": "integer"
                                        },
                                        "playerCount": {
                                            "format": "int32",
                                            "description": "Player count",
                                            "type": "integer"
                                        },
                                        "analyticsIdentifier": {
                                            "description": "Provide all necessary information which helps analytics for improvement, for example, the algorithm, dataset version, position, etc..",
                                            "type": "string"
                                        },
                                        "totalDownVotes": {
                                            "format": "int64",
                                            "description": "Total down votes",
                                            "type": "integer"
                                        },
                                        "placeId": {
                                            "format": "int64",
                                            "description": "Place Id",
                                            "type": "integer"
                                        },
                                        "price": {
                                            "format": "int64",
                                            "description": "The game paid access price",
                                            "type": "integer"
                                        },
                                        "imageToken": {
                                            "description": "Place image token",
                                            "type": "string"
                                        },
                                        "nativeAdData": {
                                            "description": "Native ad data",
                                            "type": "string"
                                        },
                                        "isSponsored": {
                                            "description": "Is sponsored",
                                            "type": "boolean"
                                        },
                                        "name": {
                                            "description": "Game name",
                                            "type": "string"
                                        },
                                        "totalUpVotes": {
                                            "format": "int64",
                                            "description": "Total up votes",
                                            "type": "integer"
                                        },
                                        "isShowSponsoredLabel": {
                                            "description": "Show the sponsored label",
                                            "type": "boolean"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "Universe id",
                                            "type": "integer"
                                        },
                                        "creatorName": {
                                            "description": "Creator name",
                                            "type": "string"
                                        },
                                        "creatorType": {
                                            "description": "Creator type",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Games"
                        },
                        "emphasis": {
                            "description": "True if we'll do the emphasis treatment for the first returned universe, false if this is a broad query\r\nNull if this is not an initial search request",
                            "type": "boolean"
                        },
                        "cutOffIndex": {
                            "format": "int64",
                            "description": "Cutoff index if q2d stats is applied, otherwise null",
                            "type": "integer"
                        },
                        "featuredSearchUniverseId": {
                            "format": "int64",
                            "description": "FeaturedSearch UniverseId if featured search is triggered, otherwise null",
                            "type": "integer"
                        },
                        "nextPageExclusiveStartId": {
                            "format": "int64",
                            "description": "NextPageExclusiveStartId",
                            "type": "integer"
                        },
                        "hasMoreRows": {
                            "description": "HasMoreRows",
                            "type": "boolean"
                        },
                        "filteredKeyword": {
                            "description": "FilteredKeyword",
                            "type": "string"
                        },
                        "correctedKeyword": {
                            "description": "CorrectedKeyword",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "500": {
            "description": "0: Compliance Context service is unavailable."
        }
    },
}
```
<hr>


## /v1/games/omni-recommendations
```json
{
    "Method": "GET",
    "Description": "Endpoint for omni recommendations",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "model.pageType",
            "enum": {
                "1": "Invalid",
                "2": "Home",
                "3": "Games"
            },
            "description": "PageType to determine which recommendations are being requested.",
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "model.sessionId",
            "description": "Id to specify a session",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for games search",
                    "properties": {
                        "Sorts": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Model for sort contents returned from multiget game lists",
                                    "properties": {
                                        "RecommendationList": {
                                            "items": {
                                                "$ref": {
                                                    "type": "object",
                                                    "description": "Model for sort contents returned from multiget game lists",
                                                    "properties": {
                                                        "ResponseModel": {
                                                            "$ref": {
                                                                "type": "object",
                                                                "description": "Container to hold different type of responses",
                                                                "properties": {
                                                                }
                                                            },
                                                            "description": "Gets or sets ResponseModel"
                                                        },
                                                        "ContentType": {
                                                            "enum": {
                                                                "1": "Invalid",
                                                                "2": "Game"
                                                            },
                                                            "description": "Gets or sets ContentType",
                                                            "type": "string"
                                                        }
                                                    }
                                                }
                                            },
                                            "type": "array",
                                            "description": "Gets or sets Topic"
                                        },
                                        "Topic": {
                                            "description": "Gets or sets Topic",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "sorts"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v1/vip-servers/{id}/subscription
```json
{
    "Method": "PATCH",
    "Description": "Updates subscription status of a vip server",
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
            "name": "id",
            "format": "int64",
            "required": true,
            "description": "The VIP Server ID"
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model to update subscriptions for a VIP server.",
                    "properties": {
                        "price": {
                            "format": "int64",
                            "description": "Price",
                            "type": "integer"
                        },
                        "active": {
                            "description": "Active",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The {Roblox.Games.Api.VipServerUpdateSubscriptionRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You are not the owner of this private server.\r\n21: You may not configure a cancelled private server. Please renew your subscription before configuring."
        },
        "400": {
            "description": "8: The creator of this game has disabled private servers for this game."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for VIP server subscription.",
                    "properties": {
                        "hasPriceChanged": {
                            "description": "Subscriptions price has changed",
                            "type": "boolean"
                        },
                        "expirationDate": {
                            "format": "date-time",
                            "description": "Expiration date",
                            "type": "string"
                        },
                        "canRenew": {
                            "description": "Can renew a subscription",
                            "type": "boolean"
                        },
                        "hasRecurringProfile": {
                            "description": "Subscription has a recurring profile",
                            "type": "boolean"
                        },
                        "price": {
                            "format": "int64",
                            "description": "Price",
                            "type": "integer"
                        },
                        "hasInsufficientFunds": {
                            "description": "Subscription cancelled due to insufficient funds",
                            "type": "boolean"
                        },
                        "expired": {
                            "description": "Expired",
                            "type": "boolean"
                        },
                        "active": {
                            "description": "Active",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: Please wait a few minutes before configuring your private server again."
        },
        "404": {
            "description": "1: The private server is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/vip-servers/{id}
```json
{
    "Method": "PATCH",
    "Description": "Updates vip server",
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
            "name": "id",
            "format": "int64",
            "required": true,
            "description": "The VIP Server ID"
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model to update a VIP server.",
                    "properties": {
                        "newJoinCode": {
                            "description": "Server join code",
                            "type": "boolean"
                        },
                        "name": {
                            "description": "Server name",
                            "type": "string"
                        },
                        "active": {
                            "description": "Server status",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The {Roblox.Games.Api.VipServerUpdateRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: You are not the owner of this private server.\r\n11: You cannot activate a cancelled private server.\r\n12: The game must not be Friends Only to allow private servers.\r\n13: Join Link can be generated only for active private servers."
        },
        "400": {
            "description": "8: The creator of this game has disabled private servers for this game.\r\n10: The name of the private server is either empty or too long."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a VIP server.",
                    "properties": {
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "Response model for VIP server permissions.",
                                "properties": {
                                    "friendsAllowed": {
                                        "description": "Friend access",
                                        "type": "boolean"
                                    },
                                    "enemyClanId": {
                                        "format": "int64",
                                        "description": "EnemyClanId",
                                        "type": "integer"
                                    },
                                    "users": {
                                        "items": {
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
                                        "type": "array",
                                        "description": "Users"
                                    },
                                    "clanAllowed": {
                                        "description": "Clan access",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Server permissions"
                        },
                        "name": {
                            "description": "Server name",
                            "type": "string"
                        },
                        "active": {
                            "description": "Server status",
                            "type": "boolean"
                        },
                        "id": {
                            "format": "int64",
                            "description": "Server Id",
                            "type": "integer"
                        },
                        "game": {
                            "$ref": {
                                "type": "object",
                                "description": "Response model for a VIP server game.",
                                "properties": {
                                    "id": {
                                        "format": "int64",
                                        "description": "Game id",
                                        "type": "integer"
                                    },
                                    "name": {
                                        "description": "Game name",
                                        "type": "string"
                                    },
                                    "rootPlace": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Response model for a VIP server place",
                                            "properties": {
                                                "id": {
                                                    "format": "int64",
                                                    "description": "Place id",
                                                    "type": "integer"
                                                },
                                                "name": {
                                                    "description": "Place name",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Place response model"
                                    }
                                }
                            },
                            "description": "Game response model"
                        },
                        "subscription": {
                            "$ref": {
                                "type": "object",
                                "description": "Response model for VIP server subscription.",
                                "properties": {
                                    "hasPriceChanged": {
                                        "description": "Subscriptions price has changed",
                                        "type": "boolean"
                                    },
                                    "expirationDate": {
                                        "format": "date-time",
                                        "description": "Expiration date",
                                        "type": "string"
                                    },
                                    "canRenew": {
                                        "description": "Can renew a subscription",
                                        "type": "boolean"
                                    },
                                    "hasRecurringProfile": {
                                        "description": "Subscription has a recurring profile",
                                        "type": "boolean"
                                    },
                                    "price": {
                                        "format": "int64",
                                        "description": "Price",
                                        "type": "integer"
                                    },
                                    "hasInsufficientFunds": {
                                        "description": "Subscription cancelled due to insufficient funds",
                                        "type": "boolean"
                                    },
                                    "expired": {
                                        "description": "Expired",
                                        "type": "boolean"
                                    },
                                    "active": {
                                        "description": "Active",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Server subscription"
                        },
                        "joinCode": {
                            "description": "Server join code",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: Please wait a few minutes before configuring your private server again."
        },
        "404": {
            "description": "1: The private server is invalid or does not exist."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Get necessary data to generate webpage",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "id",
            "format": "int64",
            "required": true,
            "description": "The VIP Server ID"
        }
    },
    "Responses": {
        "403": {
            "description": "2: You are not the owner of this private server."
        },
        "400": {
            "description": "8: The creator of this game has disabled private servers for this game."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a VIP server.",
                    "properties": {
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "Response model for VIP server permissions.",
                                "properties": {
                                    "friendsAllowed": {
                                        "description": "Friend access",
                                        "type": "boolean"
                                    },
                                    "enemyClanId": {
                                        "format": "int64",
                                        "description": "EnemyClanId",
                                        "type": "integer"
                                    },
                                    "users": {
                                        "items": {
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
                                        "type": "array",
                                        "description": "Users"
                                    },
                                    "clanAllowed": {
                                        "description": "Clan access",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Server permissions"
                        },
                        "name": {
                            "description": "Server name",
                            "type": "string"
                        },
                        "active": {
                            "description": "Server status",
                            "type": "boolean"
                        },
                        "id": {
                            "format": "int64",
                            "description": "Server Id",
                            "type": "integer"
                        },
                        "game": {
                            "$ref": {
                                "type": "object",
                                "description": "Response model for a VIP server game.",
                                "properties": {
                                    "id": {
                                        "format": "int64",
                                        "description": "Game id",
                                        "type": "integer"
                                    },
                                    "name": {
                                        "description": "Game name",
                                        "type": "string"
                                    },
                                    "rootPlace": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Response model for a VIP server place",
                                            "properties": {
                                                "id": {
                                                    "format": "int64",
                                                    "description": "Place id",
                                                    "type": "integer"
                                                },
                                                "name": {
                                                    "description": "Place name",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Place response model"
                                    }
                                }
                            },
                            "description": "Game response model"
                        },
                        "subscription": {
                            "$ref": {
                                "type": "object",
                                "description": "Response model for VIP server subscription.",
                                "properties": {
                                    "hasPriceChanged": {
                                        "description": "Subscriptions price has changed",
                                        "type": "boolean"
                                    },
                                    "expirationDate": {
                                        "format": "date-time",
                                        "description": "Expiration date",
                                        "type": "string"
                                    },
                                    "canRenew": {
                                        "description": "Can renew a subscription",
                                        "type": "boolean"
                                    },
                                    "hasRecurringProfile": {
                                        "description": "Subscription has a recurring profile",
                                        "type": "boolean"
                                    },
                                    "price": {
                                        "format": "int64",
                                        "description": "Price",
                                        "type": "integer"
                                    },
                                    "hasInsufficientFunds": {
                                        "description": "Subscription cancelled due to insufficient funds",
                                        "type": "boolean"
                                    },
                                    "expired": {
                                        "description": "Expired",
                                        "type": "boolean"
                                    },
                                    "active": {
                                        "description": "Active",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Server subscription"
                        },
                        "joinCode": {
                            "description": "Server join code",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: The private server is invalid or does not exist."
        }
    },
}
```
<hr>


## /v1/games/multiget-playability-status
```json
{
    "Method": "GET",
    "Description": "Gets a list of universe playability statuses for the authenticated user",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "A list of universe Ids. Cannot exceed a maximum of 100 IDs.",
            "name": "universeIds"
        }
    },
    "Responses": {
        "200": {
            "description": "Get the playability statuses successfully.",
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "Response model for getting a universe's playability status for a user",
                        "properties": {
                            "isPlayable": {
                                "description": "Whether or not the universe is playable for the user",
                                "type": "boolean"
                            },
                            "universeId": {
                                "format": "int64",
                                "description": "The universeId of the requested universe to help with batching requests",
                                "type": "integer"
                            },
                            "playabilityStatus": {
                                "enum": {
                                    "1": "UnplayableOtherReason",
                                    "2": "Playable",
                                    "3": "GuestProhibited",
                                    "4": "GameUnapproved",
                                    "5": "IncorrectConfiguration",
                                    "6": "UniverseRootPlaceIsPrivate",
                                    "7": "InsufficientPermissionFriendsOnly",
                                    "8": "InsufficientPermissionGroupOnly",
                                    "9": "DeviceRestricted",
                                    "10": "UnderReview",
                                    "11": "PurchaseRequired",
                                    "12": "AccountRestricted",
                                    "13": "TemporarilyUnavailable"
                                },
                                "description": "The actual playability status of the universe including the reason if unplayable",
                                "type": "string"
                            }
                        }
                    }
                },
                "type": "array"
            }
        },
        "400": {
            "description": "8: No universe IDs were specified.\r\n9: Too many universe IDs were requested."
        }
    },
}
```
<hr>


## /v1/games/{universeId}/favorites
```json
{
    "Method": "POST",
    "Description": "Favors (or unfavors) a game for the authenticated user",
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
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The Id of the universe."
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Game favorite request model.",
                    "properties": {
                        "isFavorited": {
                            "description": "true for favor the game, false for unfavor the game.",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "Request data."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n11: You are not authorized to perform this action."
        },
        "400": {
            "description": "3: The universe's root place is invalid."
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
        "429": {
            "description": "4: Too many requests have been made."
        },
        "404": {
            "description": "2: The requested universe does not exist."
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Returns if a game was marked as favorite for the authenticated user",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The Id of the universe."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Game favorite response model.",
                    "properties": {
                        "isFavorited": {
                            "description": "Is it a favorite game.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "2: The requested universe does not exist."
        },
        "400": {
            "description": "3: The universe's root place is invalid."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


# <b>Games Api v2</b>

## /v2/games/{universeId}/media
```json
{
    "Method": "GET",
    "Description": "Get the game media data",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The id of the universe we get media data from."
        }
    },
    "Responses": {
        "200": {
            "description": "Get the game media data successfully.",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "assetTypeId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "videoTitle": {
                                            "type": "string"
                                        },
                                        "videoHash": {
                                            "type": "string"
                                        },
                                        "approved": {
                                            "type": "boolean"
                                        },
                                        "assetType": {
                                            "type": "string"
                                        },
                                        "imageId": {
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
            "description": "3: The universe's root place is invalid."
        },
        "404": {
            "description": "2: The requested universe does not exist."
        }
    },
}
```
<hr>


## /v2/users/{userId}/favorite/games
```json
{
    "Method": "GET",
    "Description": "Gets users favorite games.",
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
            "description": "The user Id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "accessFilter",
            "enum": {
                "1": "All",
                "2": "Public",
                "3": "Private"
            },
            "description": "Filtering option via access level.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 25,
                "3": 50
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "5": {
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
                                        "updated": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "placeVisits": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "creator": {
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
                                            }
                                        },
                                        "rootPlace": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "Image",
                                                            "2": "TShirt",
                                                            "3": "Audio",
                                                            "4": "Mesh",
                                                            "5": "Lua",
                                                            "6": "HTML",
                                                            "7": "Text",
                                                            "8": "Hat",
                                                            "9": "Place",
                                                            "10": "Model",
                                                            "11": "Shirt",
                                                            "12": "Pants",
                                                            "13": "Decal",
                                                            "14": "Avatar",
                                                            "15": "Head",
                                                            "16": "Face",
                                                            "17": "Gear",
                                                            "18": "Badge",
                                                            "19": "GroupEmblem",
                                                            "20": "Animation",
                                                            "21": "Arms",
                                                            "22": "Legs",
                                                            "23": "Torso",
                                                            "24": "RightArm",
                                                            "25": "LeftArm",
                                                            "26": "LeftLeg",
                                                            "27": "RightLeg",
                                                            "28": "Package",
                                                            "29": "YouTubeVideo",
                                                            "30": "GamePass",
                                                            "31": "App",
                                                            "32": "Code",
                                                            "33": "Plugin",
                                                            "34": "SolidModel",
                                                            "35": "MeshPart",
                                                            "36": "HairAccessory",
                                                            "37": "FaceAccessory",
                                                            "38": "NeckAccessory",
                                                            "39": "ShoulderAccessory",
                                                            "40": "FrontAccessory",
                                                            "41": "BackAccessory",
                                                            "42": "WaistAccessory",
                                                            "43": "ClimbAnimation",
                                                            "44": "DeathAnimation",
                                                            "45": "FallAnimation",
                                                            "46": "IdleAnimation",
                                                            "47": "JumpAnimation",
                                                            "48": "RunAnimation",
                                                            "49": "SwimAnimation",
                                                            "50": "WalkAnimation",
                                                            "51": "PoseAnimation",
                                                            "52": "LocalizationTableManifest",
                                                            "53": "LocalizationTableTranslation",
                                                            "54": "EmoteAnimation",
                                                            "55": "Video",
                                                            "56": "TexturePack"
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
        }
    },
}
```
<hr>


## /v2/groups/{groupId}/games
```json
{
    "Method": "GET",
    "Description": "Gets games created by the specified group.",
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
            "description": "The group Id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "accessFilter",
            "enum": {
                "1": "All",
                "2": "Public",
                "3": "Private"
            },
            "description": "Filtering option via access level.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
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
                                        "updated": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "placeVisits": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "creator": {
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
                                            }
                                        },
                                        "rootPlace": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "Image",
                                                            "2": "TShirt",
                                                            "3": "Audio",
                                                            "4": "Mesh",
                                                            "5": "Lua",
                                                            "6": "HTML",
                                                            "7": "Text",
                                                            "8": "Hat",
                                                            "9": "Place",
                                                            "10": "Model",
                                                            "11": "Shirt",
                                                            "12": "Pants",
                                                            "13": "Decal",
                                                            "14": "Avatar",
                                                            "15": "Head",
                                                            "16": "Face",
                                                            "17": "Gear",
                                                            "18": "Badge",
                                                            "19": "GroupEmblem",
                                                            "20": "Animation",
                                                            "21": "Arms",
                                                            "22": "Legs",
                                                            "23": "Torso",
                                                            "24": "RightArm",
                                                            "25": "LeftArm",
                                                            "26": "LeftLeg",
                                                            "27": "RightLeg",
                                                            "28": "Package",
                                                            "29": "YouTubeVideo",
                                                            "30": "GamePass",
                                                            "31": "App",
                                                            "32": "Code",
                                                            "33": "Plugin",
                                                            "34": "SolidModel",
                                                            "35": "MeshPart",
                                                            "36": "HairAccessory",
                                                            "37": "FaceAccessory",
                                                            "38": "NeckAccessory",
                                                            "39": "ShoulderAccessory",
                                                            "40": "FrontAccessory",
                                                            "41": "BackAccessory",
                                                            "42": "WaistAccessory",
                                                            "43": "ClimbAnimation",
                                                            "44": "DeathAnimation",
                                                            "45": "FallAnimation",
                                                            "46": "IdleAnimation",
                                                            "47": "JumpAnimation",
                                                            "48": "RunAnimation",
                                                            "49": "SwimAnimation",
                                                            "50": "WalkAnimation",
                                                            "51": "PoseAnimation",
                                                            "52": "LocalizationTableManifest",
                                                            "53": "LocalizationTableTranslation",
                                                            "54": "EmoteAnimation",
                                                            "55": "Video",
                                                            "56": "TexturePack"
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
        "500": {
            "description": "0: Compliance Context service is unavailable."
        }
    },
}
```
<hr>


## /v2/groups/{groupId}/gamesV2
```json
{
    "Method": "GET",
    "Description": "Gets games created by the specified group. This will replace V1 after validation. Note that this can only used for public/all universes.",
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
            "description": "The group Id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "accessFilter",
            "enum": {
                "1": "All",
                "2": "Public",
                "3": "Private"
            },
            "description": "Filtering option via access level.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
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
                                        "updated": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "placeVisits": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "creator": {
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
                                            }
                                        },
                                        "rootPlace": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "Image",
                                                            "2": "TShirt",
                                                            "3": "Audio",
                                                            "4": "Mesh",
                                                            "5": "Lua",
                                                            "6": "HTML",
                                                            "7": "Text",
                                                            "8": "Hat",
                                                            "9": "Place",
                                                            "10": "Model",
                                                            "11": "Shirt",
                                                            "12": "Pants",
                                                            "13": "Decal",
                                                            "14": "Avatar",
                                                            "15": "Head",
                                                            "16": "Face",
                                                            "17": "Gear",
                                                            "18": "Badge",
                                                            "19": "GroupEmblem",
                                                            "20": "Animation",
                                                            "21": "Arms",
                                                            "22": "Legs",
                                                            "23": "Torso",
                                                            "24": "RightArm",
                                                            "25": "LeftArm",
                                                            "26": "LeftLeg",
                                                            "27": "RightLeg",
                                                            "28": "Package",
                                                            "29": "YouTubeVideo",
                                                            "30": "GamePass",
                                                            "31": "App",
                                                            "32": "Code",
                                                            "33": "Plugin",
                                                            "34": "SolidModel",
                                                            "35": "MeshPart",
                                                            "36": "HairAccessory",
                                                            "37": "FaceAccessory",
                                                            "38": "NeckAccessory",
                                                            "39": "ShoulderAccessory",
                                                            "40": "FrontAccessory",
                                                            "41": "BackAccessory",
                                                            "42": "WaistAccessory",
                                                            "43": "ClimbAnimation",
                                                            "44": "DeathAnimation",
                                                            "45": "FallAnimation",
                                                            "46": "IdleAnimation",
                                                            "47": "JumpAnimation",
                                                            "48": "RunAnimation",
                                                            "49": "SwimAnimation",
                                                            "50": "WalkAnimation",
                                                            "51": "PoseAnimation",
                                                            "52": "LocalizationTableManifest",
                                                            "53": "LocalizationTableTranslation",
                                                            "54": "EmoteAnimation",
                                                            "55": "Video",
                                                            "56": "TexturePack"
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
        "500": {
            "description": "0: Compliance Context service is unavailable."
        },
        "501": {
            "description": "1: Code path is not Implemented."
        }
    },
}
```
<hr>


## /v2/users/{userId}/games
```json
{
    "Method": "GET",
    "Description": "Gets games created by the specified user.",
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
            "description": "The user Id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "accessFilter",
            "enum": {
                "1": "All",
                "2": "Public",
                "3": "Private"
            },
            "description": "Filtering option via access level.",
        },
        "3": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "The order the results are sorted in.",
            "name": "sortOrder",
        },
        "4": {
            "in": "query",
            "type": "integer",
            "default": 10,
            "format": "int32",
            "enum": {
                "1": 10,
                "2": 25,
                "3": 50
            },
            "description": "The amount of results per request.",
            "name": "limit",
        },
        "5": {
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
                                        "updated": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "placeVisits": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "creator": {
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
                                            }
                                        },
                                        "rootPlace": {
                                            "$ref": {
                                                "properties": {
                                                    "id": {
                                                        "format": "int64",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "Image",
                                                            "2": "TShirt",
                                                            "3": "Audio",
                                                            "4": "Mesh",
                                                            "5": "Lua",
                                                            "6": "HTML",
                                                            "7": "Text",
                                                            "8": "Hat",
                                                            "9": "Place",
                                                            "10": "Model",
                                                            "11": "Shirt",
                                                            "12": "Pants",
                                                            "13": "Decal",
                                                            "14": "Avatar",
                                                            "15": "Head",
                                                            "16": "Face",
                                                            "17": "Gear",
                                                            "18": "Badge",
                                                            "19": "GroupEmblem",
                                                            "20": "Animation",
                                                            "21": "Arms",
                                                            "22": "Legs",
                                                            "23": "Torso",
                                                            "24": "RightArm",
                                                            "25": "LeftArm",
                                                            "26": "LeftLeg",
                                                            "27": "RightLeg",
                                                            "28": "Package",
                                                            "29": "YouTubeVideo",
                                                            "30": "GamePass",
                                                            "31": "App",
                                                            "32": "Code",
                                                            "33": "Plugin",
                                                            "34": "SolidModel",
                                                            "35": "MeshPart",
                                                            "36": "HairAccessory",
                                                            "37": "FaceAccessory",
                                                            "38": "NeckAccessory",
                                                            "39": "ShoulderAccessory",
                                                            "40": "FrontAccessory",
                                                            "41": "BackAccessory",
                                                            "42": "WaistAccessory",
                                                            "43": "ClimbAnimation",
                                                            "44": "DeathAnimation",
                                                            "45": "FallAnimation",
                                                            "46": "IdleAnimation",
                                                            "47": "JumpAnimation",
                                                            "48": "RunAnimation",
                                                            "49": "SwimAnimation",
                                                            "50": "WalkAnimation",
                                                            "51": "PoseAnimation",
                                                            "52": "LocalizationTableManifest",
                                                            "53": "LocalizationTableTranslation",
                                                            "54": "EmoteAnimation",
                                                            "55": "Video",
                                                            "56": "TexturePack"
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
        }
    },
}
```
<hr>


