# <b>Users Api v1</b>

## /v1/users/{userId}/username-history
```json
{
    "Method": "GET",
    "Description": "Retrieves the username history for a particular user.",
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
        "3": {
            "in": "query",
            "type": "string",
            "name": "cursor",
            "description": "The paging cursor for the previous or next page.",
        },
        "4": {
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
                                    "properties": {
                                        "name": {
                                            "description": "A past username belonging to a particular userId",
                                            "type": "string"
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
            "description": "3: The user id is invalid."
        }
    },
}
```
<hr>


## /v1/users/{userId}/display-names/validate
```json
{
    "Method": "GET",
    "Description": "Validate a display name for an existing user.",
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
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "displayName",
            "required": true,
            "description": "The display name."
        }
    },
    "Responses": {
        "403": {
            "description": "7: The user id is invalid."
        },
        "400": {
            "description": "1: Display name is too short\r\n2: Display name is too long\r\n3: Display name contains invalid characters\r\n4: Display name has been moderated\r\n6: Request must contain a birthdate"
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
            "description": "5: Display name updates for this user have been throttled"
        }
    },
}
```
<hr>


## /v1/usernames/users
```json
{
    "Method": "POST",
    "Description": "Get users by usernames.",
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
                    "description": "Request model for getting users by usernames.",
                    "properties": {
                        "excludeBannedUsers": {
                            "description": "Whether or not the response should exclude banned users",
                            "type": "boolean"
                        },
                        "usernames": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "The usernames."
                        }
                    }
                }
            },
            "description": "The {Roblox.Users.Api.MultiGetByUsernameRequest}."
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
                                    "description": "A response model specific to multi-get user by name.",
                                    "properties": {
                                        "requestedUsername": {
                                            "description": "The username the user was requested with.",
                                            "type": "string"
                                        },
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
            "description": "2: Too many usernames."
        }
    },
}
```
<hr>


## /v1/display-names/validate
```json
{
    "Method": "GET",
    "Description": "Validate a display name for a new user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "displayName",
            "required": true,
            "description": "The display name."
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "birthdate",
            "required": true,
            "description": "The new user's birthdate"
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
        "400": {
            "description": "1: Display name is too short\r\n2: Display name is too long\r\n3: Display name contains invalid characters\r\n4: Display name has been moderated\r\n6: Request must contain a birthdate"
        },
        "429": {
            "description": "5: Display name updates for this user have been throttled"
        }
    },
}
```
<hr>


## /v1/users/search
```json
{
    "Method": "GET",
    "Description": "Searches for users by keyword.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "keyword",
            "required": true,
            "description": "The search keyword."
        },
        "2": {
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
        "3": {
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
                                    "type": "object",
                                    "description": "A user response model specific to getting a user from user search.",
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "previousUsernames": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array",
                                            "description": "Previous usernames for a user."
                                        },
                                        "name": {
                                            "type": "string"
                                        },
                                        "displayName": {
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
            "description": "5: The keyword was filtered.\r\n6: The keyword is too short."
        },
        "429": {
            "description": "4: Too many requests."
        }
    },
}
```
<hr>


## /v1/users/{userId}/status
```json
{
    "Method": "PATCH",
    "Description": "Updates the user's status.",
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
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "The user id."
        },
        "2": {
            "in": "body",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "status": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n1: Invalid user"
        },
        "400": {
            "description": "2: Invalid request\r\n3: Blank status"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "status": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "4: Floodchecked"
        },
        "503": {
            "description": "5: Service unavailable"
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets a user's status.",
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
                    "properties": {
                        "status": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: Invalid user"
        }
    },
}
```
<hr>


## /v1/users/authenticated
```json
{
    "Method": "GET",
    "Description": "Gets the minimal authenticated user.",
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
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/users/{userId}/display-names
```json
{
    "Method": "PATCH",
    "Description": "Set the display name for the authorized user.",
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
            "name": "userId",
            "format": "int64",
            "required": true,
            "description": "the user id"
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for changing a display name.",
                    "properties": {
                        "newDisplayName": {
                            "description": "The users new display name.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Roblox.Users.Api.SetDisplayNameRequest}"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n7: The user id is invalid."
        },
        "400": {
            "description": "1: Display name is too short\r\n2: Display name is too long\r\n3: Display name contains invalid characters\r\n4: Display name has been moderated"
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
            "description": "5: Display name updates for this user have been throttled"
        }
    },
}
```
<hr>


## /v1/users/{userId}
```json
{
    "Method": "GET",
    "Description": "Gets detailed user information by id.",
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
                    "properties": {
                        "created": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "description": {
                            "type": "string"
                        },
                        "id": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "name": {
                            "type": "string"
                        },
                        "isBanned": {
                            "type": "boolean"
                        },
                        "displayName": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "404": {
            "description": "3: The user id is invalid."
        }
    },
}
```
<hr>


## /v1/users
```json
{
    "Method": "POST",
    "Description": "Get users by ids.",
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
                    "description": "Request model for getting users by ids.",
                    "properties": {
                        "userIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The user ids."
                        },
                        "excludeBannedUsers": {
                            "description": "Whether or not the response should exclude banned users",
                            "type": "boolean"
                        }
                    }
                }
            },
            "description": "The {Roblox.Users.Api.MultiGetByUserIdRequest}."
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
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: Too many ids."
        }
    },
}
```
<hr>


