# <b>Points Api v1</b>

## /v1/universes/{universeId}/users/{userId}
```json
{
    "Method": "POST",
    "Description": "Awards points to a user in an universe.
Can only be used by game servers from places within that universe.",
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
                    "description": "Model for awarding points",
                    "properties": {
                        "amount": {
                            "format": "int32",
                            "description": "How many points to award to the user.",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "An {Roblox.Points.Api.AwardPointsRequest}."
        },
        "2": {
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "description": "The server's place id.",
        },
        "3": {
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": "The universe's id."
        },
        "4": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user's id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for awarding points.",
                    "properties": {
                        "allTimeScore": {
                            "format": "int64",
                            "description": "The user's new all-time score.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "5: The game server is not authorized to award points in the requested universe."
        },
        "400": {
            "description": "4: The specified points amount is invalid."
        },
        "404": {
            "description": "2: The user is invalid."
        }
    },
}
```
<hr>


## /v1/universes/{universeId}/users/{userId}/all-time
```json
{
    "Method": "GET",
    "Description": "Gets a user's all-time points balance from an universe.",
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
            "description": "The universe's id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user's id."
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for getting a user's all-time score.",
                    "properties": {
                        "allTimeScore": {
                            "format": "int64",
                            "description": "The user's current all-time score.",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: The universe is invalid.\r\n2: The user is invalid."
        }
    },
}
```
<hr>


