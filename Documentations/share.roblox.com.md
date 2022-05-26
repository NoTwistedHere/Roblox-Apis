# <b>Share Api v1</b>

## /v1/share/profile
```json
{
    "Method": "GET",
    "Description": "Gets profile details.",
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
                    "description": "A profile response.",
                    "properties": {
                        "description": {
                            "description": "The description of the user",
                            "type": "string"
                        },
                        "title": {
                            "description": "The title of the user",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "2: The current user is not authorized."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/share/{gameId}/game
```json
{
    "Method": "GET",
    "Description": "Gets game details.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "gameId",
            "format": "int64",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "400": {
            "description": "2: The current user is not authorized."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "A game response.",
                    "properties": {
                        "description": {
                            "description": "The description of the game",
                            "type": "string"
                        },
                        "title": {
                            "description": "The title of the game",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "3: Game was not found."
        },
        "503": {
            "description": "1: Service unavailable, please try again later."
        }
    },
    "Internal": true
}
```
<hr>


