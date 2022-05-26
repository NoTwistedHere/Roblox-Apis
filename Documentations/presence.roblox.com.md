# <b>Presence Api v1</b>

## /v1/presence/register-app-presence
```json
{
    "Method": "POST",
    "Description": "Register User Presence for IOS, Android, Xbox, regular studio session",
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
                    "description": "Request model to Register App Presence",
                    "properties": {
                        "location": {
                            "description": "Gets or sets location",
                            "type": "string"
                        },
                        "placeId": {
                            "format": "int64",
                            "description": "Gets or sets placeId",
                            "type": "integer"
                        },
                        "disconnect": {
                            "description": "Gets or sets if session was disconnected or not",
                            "type": "boolean"
                        }
                    }
                }
            },
            "name": "registerAppPresenceRequest"
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
            "description": "0: Token Validation Failed"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/presence/users
```json
{
    "Method": "POST",
    "Description": "Get Presence for a list of users",
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
            "name": "userPresenceRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Get users presences request model",
                    "properties": {
                        "userIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "list of userIds to get presence for"
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
                    "description": "User Presences Response model",
                    "properties": {
                        "userPresences": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "",
                                    "properties": {
                                        "userPresenceType": {
                                            "enum": {
                                                "1": "Offline",
                                                "2": "Online",
                                                "3": "InGame",
                                                "4": "InStudio"
                                            },
                                            "description": "User presence Type",
                                            "type": "string"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "universe Id",
                                            "type": "integer"
                                        },
                                        "lastOnline": {
                                            "format": "date-time",
                                            "description": "last seen. {Roblox.Time.UtcInstant}",
                                            "type": "string"
                                        },
                                        "gameId": {
                                            "type": "string",
                                            "format": "uuid",
                                            "description": "game Id",
                                            "example": "00000000-0000-0000-0000-000000000000"
                                        },
                                        "lastLocation": {
                                            "description": "user's last location",
                                            "type": "string"
                                        },
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "Root place Id",
                                            "type": "integer"
                                        },
                                        "userId": {
                                            "format": "int64",
                                            "description": "user Id",
                                            "type": "integer"
                                        },
                                        "placeId": {
                                            "format": "int64",
                                            "description": "place Id",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "A collection of User Presences"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


