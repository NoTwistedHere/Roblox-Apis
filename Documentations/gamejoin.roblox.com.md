# <b>GameJoin Api v1</b>

## /v1/play-with-user
```json
{
    "Method": "POST",
    "Description": "Endpoint to play with user",
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
            "name": "playWithUserRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for join private game .",
                    "properties": {
                        "userIdToFollow": {
                            "format": "int64",
                            "description": "User Id for join private game request",
                            "type": "integer"
                        },
                        "isTeleport": {
                            "description": "Is this a teleport request",
                            "type": "boolean"
                        },
                        "browserTrackerId": {
                            "format": "int64",
                            "description": "The integer representing browserTrackerId",
                            "type": "integer"
                        },
                        "gamerTag": {
                            "description": "The gamerTag, if any, for the game join request",
                            "type": "string"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "The Place Id for the game join request",
                            "type": "integer"
                        },
                        "isPartyLeader": {
                            "description": "Boolean representing whether this request corresponds to a party leader",
                            "type": "boolean"
                        },
                        "isPlayTogetherGame": {
                            "description": "Boolean representing whether this is a PlayTogether game",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The {Request model for join private game .} in JSON format"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a game join request",
                    "properties": {
                        "message": {
                            "description": "The string message to provide additional details on status code",
                            "type": "string"
                        },
                        "joinScript": {
                            "$ref": {
                                "properties": {
                                    "GameChatType": {
                                        "type": "string"
                                    },
                                    "PlaceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "AnalyticsSessionId": {
                                        "type": "string"
                                    },
                                    "TokenGenAlgorithm": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingInterval": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ServerPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "CreatorId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "SuperSafeChat": {
                                        "type": "boolean"
                                    },
                                    "CharacterAppearance": {
                                        "type": "string"
                                    },
                                    "DirectServerReturn": {
                                        "type": "boolean"
                                    },
                                    "DisplayName": {
                                        "type": "string"
                                    },
                                    "UserName": {
                                        "type": "string"
                                    },
                                    "UdmuxEndpoints": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "format": "int32",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "Address": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "AccountAge": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "characterAppearanceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "CreatorTypeEnum": {
                                        "type": "string"
                                    },
                                    "PepperId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "SeleniumTestMode": {
                                        "type": "boolean"
                                    },
                                    "FollowUserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "MachineAddress": {
                                        "type": "string"
                                    },
                                    "RobloxLocale": {
                                        "type": "string"
                                    },
                                    "GameLocale": {
                                        "type": "string"
                                    },
                                    "ChatStyle": {
                                        "type": "string"
                                    },
                                    "ClientTicket": {
                                        "type": "string"
                                    },
                                    "AlternateName": {
                                        "type": "string"
                                    },
                                    "CountryCode": {
                                        "type": "string"
                                    },
                                    "UniverseId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "IsUnknownOrUnder13": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFirstTimePlayKey": {
                                        "type": "string"
                                    },
                                    "SessionId": {
                                        "type": "string"
                                    },
                                    "MembershipType": {
                                        "type": "string"
                                    },
                                    "BaseUrl": {
                                        "type": "string"
                                    },
                                    "GameId": {
                                        "type": "string"
                                    },
                                    "CookieStoreEnabled": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFiveMinutePlayKey": {
                                        "type": "string"
                                    },
                                    "UserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "ServerConnections": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "Address": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "ClientPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingUrl": {
                                        "type": "string"
                                    },
                                    "TokenValue": {
                                        "type": "string"
                                    },
                                    "DataCenterId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The join 'script'"
                        },
                        "joinScriptUrl": {
                            "description": "The URL to get the join 'script' from\r\nset when status == 2 (Joining)",
                            "type": "string"
                        },
                        "authenticationTicket": {
                            "description": "The authentication ticket",
                            "type": "string"
                        },
                        "authenticationUrl": {
                            "description": "The authentication URL",
                            "type": "string"
                        },
                        "status": {
                            "format": "int32",
                            "description": "The integer status code",
                            "type": "integer"
                        },
                        "jobId": {
                            "description": "The job id string",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "1: Request is not authorized from specified origin.\r\n2: User is invalid or does not exist."
        },
        "400": {
            "description": "-1: An unknown error occurred."
        },
        "429": {
            "description": "3: Too many requests, please slow down."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/join-play-together-game
```json
{
    "Method": "POST",
    "Description": "Endpoint to join play together game",
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
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for join game instance.",
                    "properties": {
                        "isTeleport": {
                            "description": "Is this a teleport request",
                            "type": "boolean"
                        },
                        "browserTrackerId": {
                            "format": "int64",
                            "description": "The integer representing browserTrackerId",
                            "type": "integer"
                        },
                        "gamerTag": {
                            "description": "The gamerTag, if any, for the game join request",
                            "type": "string"
                        },
                        "isPlayTogetherGame": {
                            "description": "Boolean representing whether this is a PlayTogether game",
                            "type": "boolean"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "The Place Id for the game join request",
                            "type": "integer"
                        },
                        "isPartyLeader": {
                            "description": "Boolean representing whether this request corresponds to a party leader",
                            "type": "boolean"
                        },
                        "conversationId": {
                            "format": "int64",
                            "description": "conversation id for requesting play together game",
                            "type": "integer"
                        }
                    }
                }
            },
            "name": "joinPlayTogetherGameRequest"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a game join request",
                    "properties": {
                        "message": {
                            "description": "The string message to provide additional details on status code",
                            "type": "string"
                        },
                        "joinScript": {
                            "$ref": {
                                "properties": {
                                    "GameChatType": {
                                        "type": "string"
                                    },
                                    "PlaceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "AnalyticsSessionId": {
                                        "type": "string"
                                    },
                                    "TokenGenAlgorithm": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingInterval": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ServerPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "CreatorId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "SuperSafeChat": {
                                        "type": "boolean"
                                    },
                                    "CharacterAppearance": {
                                        "type": "string"
                                    },
                                    "DirectServerReturn": {
                                        "type": "boolean"
                                    },
                                    "DisplayName": {
                                        "type": "string"
                                    },
                                    "UserName": {
                                        "type": "string"
                                    },
                                    "UdmuxEndpoints": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "format": "int32",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "Address": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "AccountAge": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "characterAppearanceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "CreatorTypeEnum": {
                                        "type": "string"
                                    },
                                    "PepperId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "SeleniumTestMode": {
                                        "type": "boolean"
                                    },
                                    "FollowUserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "MachineAddress": {
                                        "type": "string"
                                    },
                                    "RobloxLocale": {
                                        "type": "string"
                                    },
                                    "GameLocale": {
                                        "type": "string"
                                    },
                                    "ChatStyle": {
                                        "type": "string"
                                    },
                                    "ClientTicket": {
                                        "type": "string"
                                    },
                                    "AlternateName": {
                                        "type": "string"
                                    },
                                    "CountryCode": {
                                        "type": "string"
                                    },
                                    "UniverseId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "IsUnknownOrUnder13": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFirstTimePlayKey": {
                                        "type": "string"
                                    },
                                    "SessionId": {
                                        "type": "string"
                                    },
                                    "MembershipType": {
                                        "type": "string"
                                    },
                                    "BaseUrl": {
                                        "type": "string"
                                    },
                                    "GameId": {
                                        "type": "string"
                                    },
                                    "CookieStoreEnabled": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFiveMinutePlayKey": {
                                        "type": "string"
                                    },
                                    "UserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "ServerConnections": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "Address": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "ClientPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingUrl": {
                                        "type": "string"
                                    },
                                    "TokenValue": {
                                        "type": "string"
                                    },
                                    "DataCenterId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The join 'script'"
                        },
                        "joinScriptUrl": {
                            "description": "The URL to get the join 'script' from\r\nset when status == 2 (Joining)",
                            "type": "string"
                        },
                        "authenticationTicket": {
                            "description": "The authentication ticket",
                            "type": "string"
                        },
                        "authenticationUrl": {
                            "description": "The authentication URL",
                            "type": "string"
                        },
                        "status": {
                            "format": "int32",
                            "description": "The integer status code",
                            "type": "integer"
                        },
                        "jobId": {
                            "description": "The job id string",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "1: Request is not authorized from specified origin.\r\n2: User is invalid or does not exist."
        },
        "400": {
            "description": "-1: An unknown error occurred."
        },
        "429": {
            "description": "3: Too many requests, please slow down."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/team-create
```json
{
    "Method": "POST",
    "Description": "Endpoint to join team create session",
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
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for create team .",
                    "properties": {
                        "isTeleport": {
                            "description": "Is this a teleport request",
                            "type": "boolean"
                        },
                        "browserTrackerId": {
                            "format": "int64",
                            "description": "The integer representing browserTrackerId",
                            "type": "integer"
                        },
                        "gamerTag": {
                            "description": "The gamerTag, if any, for the game join request",
                            "type": "string"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "The Place Id for the game join request",
                            "type": "integer"
                        },
                        "isPartyLeader": {
                            "description": "Boolean representing whether this request corresponds to a party leader",
                            "type": "boolean"
                        },
                        "isPlayTogetherGame": {
                            "description": "Boolean representing whether this is a PlayTogether game",
                            "type": "boolean"
                        }
                    }
                }
            },
            "name": "teamCreateRequest"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a create team request",
                    "properties": {
                        "status": {
                            "format": "int32",
                            "description": "The integer status code",
                            "type": "integer"
                        },
                        "settings": {
                            "description": "settings",
                            "type": "object"
                        },
                        "message": {
                            "description": "The string message to provide additional details on status code",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "1: Request is not authorized from specified origin.\r\n2: User is invalid or does not exist."
        },
        "400": {
            "description": "-1: An unknown error occurred."
        },
        "429": {
            "description": "3: Too many requests, please slow down."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/join-game
```json
{
    "Method": "POST",
    "Description": "Endpoint to join a game",
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
            "name": "gameJoinRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for game join.",
                    "properties": {
                        "isTeleport": {
                            "description": "Is this a teleport request",
                            "type": "boolean"
                        },
                        "browserTrackerId": {
                            "format": "int64",
                            "description": "The integer representing browserTrackerId",
                            "type": "integer"
                        },
                        "gamerTag": {
                            "description": "The gamerTag, if any, for the game join request",
                            "type": "string"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "The Place Id for the game join request",
                            "type": "integer"
                        },
                        "isPartyLeader": {
                            "description": "Boolean representing whether this request corresponds to a party leader",
                            "type": "boolean"
                        },
                        "isPlayTogetherGame": {
                            "description": "Boolean representing whether this is a PlayTogether game",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The {Request model for game join.} in JSON format"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a game join request",
                    "properties": {
                        "message": {
                            "description": "The string message to provide additional details on status code",
                            "type": "string"
                        },
                        "joinScript": {
                            "$ref": {
                                "properties": {
                                    "GameChatType": {
                                        "type": "string"
                                    },
                                    "PlaceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "AnalyticsSessionId": {
                                        "type": "string"
                                    },
                                    "TokenGenAlgorithm": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingInterval": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ServerPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "CreatorId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "SuperSafeChat": {
                                        "type": "boolean"
                                    },
                                    "CharacterAppearance": {
                                        "type": "string"
                                    },
                                    "DirectServerReturn": {
                                        "type": "boolean"
                                    },
                                    "DisplayName": {
                                        "type": "string"
                                    },
                                    "UserName": {
                                        "type": "string"
                                    },
                                    "UdmuxEndpoints": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "format": "int32",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "Address": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "AccountAge": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "characterAppearanceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "CreatorTypeEnum": {
                                        "type": "string"
                                    },
                                    "PepperId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "SeleniumTestMode": {
                                        "type": "boolean"
                                    },
                                    "FollowUserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "MachineAddress": {
                                        "type": "string"
                                    },
                                    "RobloxLocale": {
                                        "type": "string"
                                    },
                                    "GameLocale": {
                                        "type": "string"
                                    },
                                    "ChatStyle": {
                                        "type": "string"
                                    },
                                    "ClientTicket": {
                                        "type": "string"
                                    },
                                    "AlternateName": {
                                        "type": "string"
                                    },
                                    "CountryCode": {
                                        "type": "string"
                                    },
                                    "UniverseId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "IsUnknownOrUnder13": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFirstTimePlayKey": {
                                        "type": "string"
                                    },
                                    "SessionId": {
                                        "type": "string"
                                    },
                                    "MembershipType": {
                                        "type": "string"
                                    },
                                    "BaseUrl": {
                                        "type": "string"
                                    },
                                    "GameId": {
                                        "type": "string"
                                    },
                                    "CookieStoreEnabled": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFiveMinutePlayKey": {
                                        "type": "string"
                                    },
                                    "UserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "ServerConnections": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "Address": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "ClientPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingUrl": {
                                        "type": "string"
                                    },
                                    "TokenValue": {
                                        "type": "string"
                                    },
                                    "DataCenterId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The join 'script'"
                        },
                        "joinScriptUrl": {
                            "description": "The URL to get the join 'script' from\r\nset when status == 2 (Joining)",
                            "type": "string"
                        },
                        "authenticationTicket": {
                            "description": "The authentication ticket",
                            "type": "string"
                        },
                        "authenticationUrl": {
                            "description": "The authentication URL",
                            "type": "string"
                        },
                        "status": {
                            "format": "int32",
                            "description": "The integer status code",
                            "type": "integer"
                        },
                        "jobId": {
                            "description": "The job id string",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "1: Request is not authorized from specified origin.\r\n2: User is invalid or does not exist."
        },
        "400": {
            "description": "-1: An unknown error occurred."
        },
        "429": {
            "description": "3: Too many requests, please slow down."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/join-private-game
```json
{
    "Method": "POST",
    "Description": "Endpoint to join a private game",
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
            "name": "joinPrivateGameRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for join private game .",
                    "properties": {
                        "isTeleport": {
                            "description": "Is this a teleport request",
                            "type": "boolean"
                        },
                        "browserTrackerId": {
                            "format": "int64",
                            "description": "The integer representing browserTrackerId",
                            "type": "integer"
                        },
                        "isPlayTogetherGame": {
                            "description": "Boolean representing whether this is a PlayTogether game",
                            "type": "boolean"
                        },
                        "gamerTag": {
                            "description": "The gamerTag, if any, for the game join request",
                            "type": "string"
                        },
                        "linkCode": {
                            "description": "link code for join private game request",
                            "type": "string"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "The Place Id for the game join request",
                            "type": "integer"
                        },
                        "isPartyLeader": {
                            "description": "Boolean representing whether this request corresponds to a party leader",
                            "type": "boolean"
                        },
                        "accessCode": {
                            "description": "access code for join private game request",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Request model for join private game .} in JSON format"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a game join request",
                    "properties": {
                        "message": {
                            "description": "The string message to provide additional details on status code",
                            "type": "string"
                        },
                        "joinScript": {
                            "$ref": {
                                "properties": {
                                    "GameChatType": {
                                        "type": "string"
                                    },
                                    "PlaceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "AnalyticsSessionId": {
                                        "type": "string"
                                    },
                                    "TokenGenAlgorithm": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingInterval": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ServerPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "CreatorId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "SuperSafeChat": {
                                        "type": "boolean"
                                    },
                                    "CharacterAppearance": {
                                        "type": "string"
                                    },
                                    "DirectServerReturn": {
                                        "type": "boolean"
                                    },
                                    "DisplayName": {
                                        "type": "string"
                                    },
                                    "UserName": {
                                        "type": "string"
                                    },
                                    "UdmuxEndpoints": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "format": "int32",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "Address": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "AccountAge": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "characterAppearanceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "CreatorTypeEnum": {
                                        "type": "string"
                                    },
                                    "PepperId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "SeleniumTestMode": {
                                        "type": "boolean"
                                    },
                                    "FollowUserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "MachineAddress": {
                                        "type": "string"
                                    },
                                    "RobloxLocale": {
                                        "type": "string"
                                    },
                                    "GameLocale": {
                                        "type": "string"
                                    },
                                    "ChatStyle": {
                                        "type": "string"
                                    },
                                    "ClientTicket": {
                                        "type": "string"
                                    },
                                    "AlternateName": {
                                        "type": "string"
                                    },
                                    "CountryCode": {
                                        "type": "string"
                                    },
                                    "UniverseId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "IsUnknownOrUnder13": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFirstTimePlayKey": {
                                        "type": "string"
                                    },
                                    "SessionId": {
                                        "type": "string"
                                    },
                                    "MembershipType": {
                                        "type": "string"
                                    },
                                    "BaseUrl": {
                                        "type": "string"
                                    },
                                    "GameId": {
                                        "type": "string"
                                    },
                                    "CookieStoreEnabled": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFiveMinutePlayKey": {
                                        "type": "string"
                                    },
                                    "UserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "ServerConnections": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "Address": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "ClientPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingUrl": {
                                        "type": "string"
                                    },
                                    "TokenValue": {
                                        "type": "string"
                                    },
                                    "DataCenterId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The join 'script'"
                        },
                        "joinScriptUrl": {
                            "description": "The URL to get the join 'script' from\r\nset when status == 2 (Joining)",
                            "type": "string"
                        },
                        "authenticationTicket": {
                            "description": "The authentication ticket",
                            "type": "string"
                        },
                        "authenticationUrl": {
                            "description": "The authentication URL",
                            "type": "string"
                        },
                        "status": {
                            "format": "int32",
                            "description": "The integer status code",
                            "type": "integer"
                        },
                        "jobId": {
                            "description": "The job id string",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "1: Request is not authorized from specified origin.\r\n2: User is invalid or does not exist."
        },
        "400": {
            "description": "-1: An unknown error occurred."
        },
        "429": {
            "description": "3: Too many requests, please slow down."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/teleport
```json
{
    "Method": "POST",
    "Description": "Initiates a Teleport of a Group of Players.",
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
            "in": "header",
            "type": "string",
            "name": "Roblox-Game-Id",
            "description": "The {System.Guid} of the requesting game server.",
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "description": "The {!:IPlace.Id} of the requesting game server.",
        },
        "3": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A request model for {M:Roblox.GameJoin.Api.Controllers.V1.TeleportController.TeleportGroup(System.Guid,System.Int64,Roblox.GameJoin.Api.GroupTeleportRequest)}.",
                    "properties": {
                        "teleportId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "The Id for the Group Teleport",
                            "example": "00000000-0000-0000-0000-000000000000"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "The Target Place Id for the Group Teleport",
                            "type": "integer"
                        },
                        "members": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A request model for a Teleport Group Member",
                                    "properties": {
                                        "userId": {
                                            "format": "int64",
                                            "description": "The Member's {!:IUser.Id}",
                                            "type": "integer"
                                        },
                                        "gameSession": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Game session information that is passed to the client during game launch",
                                                "properties": {
                                                    "PlatformTypeId": {
                                                        "format": "int32",
                                                        "description": "The Member's {Roblox.Platform.Devices.IPlatform.PlatformTypeId}",
                                                        "type": "integer"
                                                    },
                                                    "PolicyCountryId": {
                                                        "format": "int32",
                                                        "description": "The Member's Policy Country ID (if any)",
                                                        "type": "integer"
                                                    },
                                                    "ClientIpAddress": {
                                                        "description": "The Member's IPV4 Address represented as a string",
                                                        "type": "string"
                                                    }
                                                }
                                            },
                                            "description": "The Member's {Game session information that is passed to the client during game launch}"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "The Members that Source Server intends to Teleport as a Group"
                        },
                        "gameId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "The Target Game Id for the Group Teleport",
                            "example": "00000000-0000-0000-0000-000000000000"
                        }
                    }
                }
            },
            "description": "The {A request model for {M:Roblox.GameJoin.Api.Controllers.V1.TeleportController.TeleportGroup(System.Guid,System.Int64,Roblox.GameJoin.Api.GroupTeleportRequest)}.}."
        }
    },
    "Responses": {
        "403": {
            "description": "8: The requested Teleport Group is too large.\r\n9: The Source Place and the Destination Place are not in the same Universe.\r\n11: A specified Member cannot join the Destination Place"
        },
        "400": {
            "description": "1: The Source Place is invalid.\r\n2: The Source Universe is invalid.\r\n3: The Source Game is invalid.\r\n4: The Destination Place is invalid.\r\n5: The Destination Universe is invalid.\r\n6: The Destination Game is invalid.\r\n7: The requested Teleport Group is empty.\r\n10: A sepecified Member is not a valid User\r\n15: The Members were not defined or are invalid.\r\n16: A Member's GameInfo was not defined or are invalid.\r\n17: A duplicate Member has been specified in this Teleport Group."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A response model for a {M:Roblox.GameJoin.Api.Controllers.V1.TeleportController.TeleportGroup(System.Guid,System.Int64,Roblox.GameJoin.Api.GroupTeleportRequest)}request",
                    "properties": {
                        "absentMembers": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The Members that were part of the {A request model for {M:Roblox.GameJoin.Api.Controllers.V1.TeleportController.TeleportGroup(System.Guid,System.Int64,Roblox.GameJoin.Api.GroupTeleportRequest)}.}, but were not present in the Source Server"
                        },
                        "members": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The Members actually considered as part of the Teleport Group"
                        },
                        "gameId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "The Id of the Destination Server for the Teleport Group",
                            "example": "00000000-0000-0000-0000-000000000000"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "13: Too many requests to Teleport have been made."
        },
        "500": {
            "description": "12: Failed to create a Group Teleport reservation."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/join-reserved-game
```json
{
    "Method": "POST",
    "Description": "Endpoint to join a reserved game",
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
            "name": "joinReservedGameRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for join private game .",
                    "properties": {
                        "isTeleport": {
                            "description": "Is this a teleport request",
                            "type": "boolean"
                        },
                        "browserTrackerId": {
                            "format": "int64",
                            "description": "The integer representing browserTrackerId",
                            "type": "integer"
                        },
                        "isPlayTogetherGame": {
                            "description": "Boolean representing whether this is a PlayTogether game",
                            "type": "boolean"
                        },
                        "gamerTag": {
                            "description": "The gamerTag, if any, for the game join request",
                            "type": "string"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "The Place Id for the game join request",
                            "type": "integer"
                        },
                        "isPartyLeader": {
                            "description": "Boolean representing whether this request corresponds to a party leader",
                            "type": "boolean"
                        },
                        "accessCode": {
                            "description": "access code for join private game request",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Request model for join private game .} in JSON format"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a game join request",
                    "properties": {
                        "message": {
                            "description": "The string message to provide additional details on status code",
                            "type": "string"
                        },
                        "joinScript": {
                            "$ref": {
                                "properties": {
                                    "GameChatType": {
                                        "type": "string"
                                    },
                                    "PlaceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "AnalyticsSessionId": {
                                        "type": "string"
                                    },
                                    "TokenGenAlgorithm": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingInterval": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ServerPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "CreatorId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "SuperSafeChat": {
                                        "type": "boolean"
                                    },
                                    "CharacterAppearance": {
                                        "type": "string"
                                    },
                                    "DirectServerReturn": {
                                        "type": "boolean"
                                    },
                                    "DisplayName": {
                                        "type": "string"
                                    },
                                    "UserName": {
                                        "type": "string"
                                    },
                                    "UdmuxEndpoints": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "format": "int32",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "Address": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "AccountAge": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "characterAppearanceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "CreatorTypeEnum": {
                                        "type": "string"
                                    },
                                    "PepperId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "SeleniumTestMode": {
                                        "type": "boolean"
                                    },
                                    "FollowUserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "MachineAddress": {
                                        "type": "string"
                                    },
                                    "RobloxLocale": {
                                        "type": "string"
                                    },
                                    "GameLocale": {
                                        "type": "string"
                                    },
                                    "ChatStyle": {
                                        "type": "string"
                                    },
                                    "ClientTicket": {
                                        "type": "string"
                                    },
                                    "AlternateName": {
                                        "type": "string"
                                    },
                                    "CountryCode": {
                                        "type": "string"
                                    },
                                    "UniverseId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "IsUnknownOrUnder13": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFirstTimePlayKey": {
                                        "type": "string"
                                    },
                                    "SessionId": {
                                        "type": "string"
                                    },
                                    "MembershipType": {
                                        "type": "string"
                                    },
                                    "BaseUrl": {
                                        "type": "string"
                                    },
                                    "GameId": {
                                        "type": "string"
                                    },
                                    "CookieStoreEnabled": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFiveMinutePlayKey": {
                                        "type": "string"
                                    },
                                    "UserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "ServerConnections": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "Address": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "ClientPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingUrl": {
                                        "type": "string"
                                    },
                                    "TokenValue": {
                                        "type": "string"
                                    },
                                    "DataCenterId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The join 'script'"
                        },
                        "joinScriptUrl": {
                            "description": "The URL to get the join 'script' from\r\nset when status == 2 (Joining)",
                            "type": "string"
                        },
                        "authenticationTicket": {
                            "description": "The authentication ticket",
                            "type": "string"
                        },
                        "authenticationUrl": {
                            "description": "The authentication URL",
                            "type": "string"
                        },
                        "status": {
                            "format": "int32",
                            "description": "The integer status code",
                            "type": "integer"
                        },
                        "jobId": {
                            "description": "The job id string",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "1: Request is not authorized from specified origin.\r\n2: User is invalid or does not exist."
        },
        "400": {
            "description": "-1: An unknown error occurred."
        },
        "429": {
            "description": "3: Too many requests, please slow down."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/join-game-instance
```json
{
    "Method": "POST",
    "Description": "Endpoint to join a particular game instance",
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
            "name": "joinGameInstanceRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for join game instance.",
                    "properties": {
                        "isTeleport": {
                            "description": "Is this a teleport request",
                            "type": "boolean"
                        },
                        "browserTrackerId": {
                            "format": "int64",
                            "description": "The integer representing browserTrackerId",
                            "type": "integer"
                        },
                        "gameId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "The Guid representing the game instance",
                            "example": "00000000-0000-0000-0000-000000000000"
                        },
                        "gamerTag": {
                            "description": "The gamerTag, if any, for the game join request",
                            "type": "string"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "The Place Id for the game join request",
                            "type": "integer"
                        },
                        "isPartyLeader": {
                            "description": "Boolean representing whether this request corresponds to a party leader",
                            "type": "boolean"
                        },
                        "isPlayTogetherGame": {
                            "description": "Boolean representing whether this is a PlayTogether game",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The {Request model for join game instance.} in JSON format"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a game join request",
                    "properties": {
                        "message": {
                            "description": "The string message to provide additional details on status code",
                            "type": "string"
                        },
                        "joinScript": {
                            "$ref": {
                                "properties": {
                                    "GameChatType": {
                                        "type": "string"
                                    },
                                    "PlaceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "AnalyticsSessionId": {
                                        "type": "string"
                                    },
                                    "TokenGenAlgorithm": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingInterval": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ServerPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "CreatorId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "SuperSafeChat": {
                                        "type": "boolean"
                                    },
                                    "CharacterAppearance": {
                                        "type": "string"
                                    },
                                    "DirectServerReturn": {
                                        "type": "boolean"
                                    },
                                    "DisplayName": {
                                        "type": "string"
                                    },
                                    "UserName": {
                                        "type": "string"
                                    },
                                    "UdmuxEndpoints": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "format": "int32",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "Address": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "AccountAge": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "characterAppearanceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "CreatorTypeEnum": {
                                        "type": "string"
                                    },
                                    "PepperId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "SeleniumTestMode": {
                                        "type": "boolean"
                                    },
                                    "FollowUserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "MachineAddress": {
                                        "type": "string"
                                    },
                                    "RobloxLocale": {
                                        "type": "string"
                                    },
                                    "GameLocale": {
                                        "type": "string"
                                    },
                                    "ChatStyle": {
                                        "type": "string"
                                    },
                                    "ClientTicket": {
                                        "type": "string"
                                    },
                                    "AlternateName": {
                                        "type": "string"
                                    },
                                    "CountryCode": {
                                        "type": "string"
                                    },
                                    "UniverseId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "IsUnknownOrUnder13": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFirstTimePlayKey": {
                                        "type": "string"
                                    },
                                    "SessionId": {
                                        "type": "string"
                                    },
                                    "MembershipType": {
                                        "type": "string"
                                    },
                                    "BaseUrl": {
                                        "type": "string"
                                    },
                                    "GameId": {
                                        "type": "string"
                                    },
                                    "CookieStoreEnabled": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFiveMinutePlayKey": {
                                        "type": "string"
                                    },
                                    "UserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "ServerConnections": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "Address": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "ClientPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingUrl": {
                                        "type": "string"
                                    },
                                    "TokenValue": {
                                        "type": "string"
                                    },
                                    "DataCenterId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The join 'script'"
                        },
                        "joinScriptUrl": {
                            "description": "The URL to get the join 'script' from\r\nset when status == 2 (Joining)",
                            "type": "string"
                        },
                        "authenticationTicket": {
                            "description": "The authentication ticket",
                            "type": "string"
                        },
                        "authenticationUrl": {
                            "description": "The authentication URL",
                            "type": "string"
                        },
                        "status": {
                            "format": "int32",
                            "description": "The integer status code",
                            "type": "integer"
                        },
                        "jobId": {
                            "description": "The job id string",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "1: Request is not authorized from specified origin.\r\n2: User is invalid or does not exist."
        },
        "400": {
            "description": "-1: An unknown error occurred."
        },
        "429": {
            "description": "3: Too many requests, please slow down."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/play-with-party
```json
{
    "Method": "POST",
    "Description": "Endpoint to play with party",
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
            "name": "playWithPartyRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for join game instance.",
                    "properties": {
                        "isTeleport": {
                            "description": "Is this a teleport request",
                            "type": "boolean"
                        },
                        "browserTrackerId": {
                            "format": "int64",
                            "description": "The integer representing browserTrackerId",
                            "type": "integer"
                        },
                        "gameId": {
                            "type": "string",
                            "format": "uuid",
                            "description": "The Guid representing the game instance",
                            "example": "00000000-0000-0000-0000-000000000000"
                        },
                        "gamerTag": {
                            "description": "The gamerTag, if any, for the game join request",
                            "type": "string"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "The Place Id for the game join request",
                            "type": "integer"
                        },
                        "isPartyLeader": {
                            "description": "Boolean representing whether this request corresponds to a party leader",
                            "type": "boolean"
                        },
                        "isPlayTogetherGame": {
                            "description": "Boolean representing whether this is a PlayTogether game",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The {Request model for join game instance.} in JSON format"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for a game join request",
                    "properties": {
                        "message": {
                            "description": "The string message to provide additional details on status code",
                            "type": "string"
                        },
                        "joinScript": {
                            "$ref": {
                                "properties": {
                                    "GameChatType": {
                                        "type": "string"
                                    },
                                    "PlaceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "AnalyticsSessionId": {
                                        "type": "string"
                                    },
                                    "TokenGenAlgorithm": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingInterval": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "ServerPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "CreatorId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "SuperSafeChat": {
                                        "type": "boolean"
                                    },
                                    "CharacterAppearance": {
                                        "type": "string"
                                    },
                                    "DirectServerReturn": {
                                        "type": "boolean"
                                    },
                                    "DisplayName": {
                                        "type": "string"
                                    },
                                    "UserName": {
                                        "type": "string"
                                    },
                                    "UdmuxEndpoints": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "format": "int32",
                                                        "readOnly": true,
                                                        "type": "integer"
                                                    },
                                                    "Address": {
                                                        "readOnly": true,
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "AccountAge": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "characterAppearanceId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "CreatorTypeEnum": {
                                        "type": "string"
                                    },
                                    "PepperId": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "SeleniumTestMode": {
                                        "type": "boolean"
                                    },
                                    "FollowUserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "MachineAddress": {
                                        "type": "string"
                                    },
                                    "RobloxLocale": {
                                        "type": "string"
                                    },
                                    "GameLocale": {
                                        "type": "string"
                                    },
                                    "ChatStyle": {
                                        "type": "string"
                                    },
                                    "ClientTicket": {
                                        "type": "string"
                                    },
                                    "AlternateName": {
                                        "type": "string"
                                    },
                                    "CountryCode": {
                                        "type": "string"
                                    },
                                    "UniverseId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "IsUnknownOrUnder13": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFirstTimePlayKey": {
                                        "type": "string"
                                    },
                                    "SessionId": {
                                        "type": "string"
                                    },
                                    "MembershipType": {
                                        "type": "string"
                                    },
                                    "BaseUrl": {
                                        "type": "string"
                                    },
                                    "GameId": {
                                        "type": "string"
                                    },
                                    "CookieStoreEnabled": {
                                        "type": "boolean"
                                    },
                                    "CookieStoreFiveMinutePlayKey": {
                                        "type": "string"
                                    },
                                    "UserId": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "ServerConnections": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Port": {
                                                        "type": "integer",
                                                        "format": "int32"
                                                    },
                                                    "Address": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array"
                                    },
                                    "ClientPort": {
                                        "type": "integer",
                                        "format": "int32"
                                    },
                                    "PingUrl": {
                                        "type": "string"
                                    },
                                    "TokenValue": {
                                        "type": "string"
                                    },
                                    "DataCenterId": {
                                        "type": "integer",
                                        "format": "int32"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The join 'script'"
                        },
                        "joinScriptUrl": {
                            "description": "The URL to get the join 'script' from\r\nset when status == 2 (Joining)",
                            "type": "string"
                        },
                        "authenticationTicket": {
                            "description": "The authentication ticket",
                            "type": "string"
                        },
                        "authenticationUrl": {
                            "description": "The authentication URL",
                            "type": "string"
                        },
                        "status": {
                            "format": "int32",
                            "description": "The integer status code",
                            "type": "integer"
                        },
                        "jobId": {
                            "description": "The job id string",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "1: Request is not authorized from specified origin.\r\n2: User is invalid or does not exist."
        },
        "400": {
            "description": "-1: An unknown error occurred."
        },
        "429": {
            "description": "3: Too many requests, please slow down."
        }
    },
    "Internal": false
}
```
<hr>


