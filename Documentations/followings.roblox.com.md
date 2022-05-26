# <b>Followings Api v1</b>

## /v1/users/{userId}/universes/{universeId}/status
```json
{
    "Method": "GET",
    "Description": "Gets the status of a following relationship between a user and a universe.",
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
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "The status of the following relationship.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for a user following a universe  state controller responses",
                    "properties": {
                        "UniverseId": {
                            "readOnly": true,
                            "format": "int64",
                            "description": "The id of the universe.",
                            "type": "integer"
                        },
                        "IsFollowing": {
                            "type": "boolean",
                            "description": "If the user is currently following the universe.",
                            "readOnly": true
                        },
                        "FollowingLimitByType": {
                            "readOnly": true,
                            "format": "int32",
                            "description": "The limit to the number of followings between a user and a universe for a specific user.",
                            "type": "integer"
                        },
                        "FollowingCountByType": {
                            "readOnly": true,
                            "format": "int32",
                            "description": "The number of followings between this user and a universe.",
                            "type": "integer"
                        },
                        "UserId": {
                            "readOnly": true,
                            "format": "int64",
                            "description": "The id of the user.",
                            "type": "integer"
                        },
                        "CanFollow": {
                            "type": "boolean",
                            "description": "If the user can follow the universe.",
                            "readOnly": true
                        }
                    }
                }
            }
        },
        "403": {
            "description": "User is not authorized for this action."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/users/{userId}/universes/{universeId}
```json
{
    "Method": "POST",
    "Description": "Creates the following between a user with {userId} and universe with {universeId}",
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
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "The created following.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for a user following a universe controller responses",
                    "properties": {
                        "userId": {
                            "format": "int64",
                            "description": "The id of the user that is following",
                            "type": "integer"
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "The id of the universe being followed",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "User is not authorized for this action.\r\n0: Token Validation Failed"
        },
        "400": {
            "description": "The user has reached the limit of number of followed universes."
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
    "Method": "DELETE",
    "Description": "Deletes the following between a user with {userId} and universe with {universeId}",
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
            "in": "path",
            "type": "integer",
            "name": "universeId",
            "format": "int64",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "The deleted following.",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Model for a user following a universe controller responses",
                    "properties": {
                        "userId": {
                            "format": "int64",
                            "description": "The id of the user that is following",
                            "type": "integer"
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "The id of the universe being followed",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "403": {
            "description": "User is not authorized for this action.\r\n0: Token Validation Failed"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/users/{userId}/universes
```json
{
    "Method": "GET",
    "Description": "Gets all the followings between a user with {userId} and universes",
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
        }
    },
    "Responses": {
        "200": {
            "description": "A list of user to game followings.",
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "Model for a user following a universe controller responses",
                        "properties": {
                            "userId": {
                                "format": "int64",
                                "description": "The id of the user that is following",
                                "type": "integer"
                            },
                            "universeId": {
                                "format": "int64",
                                "description": "The id of the universe being followed",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "array"
            }
        },
        "403": {
            "description": "User is not authorized for this action."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


