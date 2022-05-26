# <b>TranslationRoles Api v1</b>

## /v1/game-localization-roles/games/{gameId}/roles/{role}/assignees
```json
{
    "Method": "GET",
    "Description": "Gets list of users assigned a specific role in a game.",
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
            "description": "The id of the game"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "role",
            "enum": {
                "1": "translator"
            },
            "required": true,
            "description": "The {Roblox.GameLocalization.Client.GameLocalizationRoles.GameLocalizationRoleType}"
        }
    },
    "Responses": {
        "403": {
            "description": "1: You must be authorized to use this endpoint"
        },
        "400": {
            "description": "3: Invalid game id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
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
                                        "type": {
                                            "type": "string",
                                            "enum": {
                                                "1": "user",
                                                "2": "group",
                                                "3": "groupRole"
                                            }
                                        },
                                        "name": {
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
        "503": {
            "description": "2: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/game-localization-roles/roles/{role}/current-user
```json
{
    "Method": "GET",
    "Description": "Gets the list of games and associated role assignment info for the requested user and role.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "role",
            "enum": {
                "1": "translator"
            },
            "required": true,
            "description": "The {Roblox.GameLocalization.Client.GameLocalizationRoles.GameLocalizationRoleType}"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "exclusiveStartKey",
            "description": "Part of pagination. Last primary key of returned items in previous operation.",
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "description": "Part of pagination. Maximum number of items that might be returned in the page.",
        }
    },
    "Responses": {
        "500": {
            "description": "0: An unknown error occurred"
        },
        "400": {
            "description": "10: Invalid page size\r\n11: Maximum page size exceeded\r\n12: Invalid exclusive start key"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model containing a list of games and associated role assignment info for the requested user and role.",
                    "properties": {
                        "games": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "gameId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "assignee": {
                                            "$ref": {
                                                "properties": {
                                                    "assigneeType": {
                                                        "type": "string",
                                                        "enum": {
                                                            "1": "user",
                                                            "2": "group",
                                                            "3": "groupRole"
                                                        }
                                                    },
                                                    "id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "List of games with associated role assignment info."
                        },
                        "previousPageCursor": {
                            "description": "Cursor which can be used for navigating to previous page.",
                            "type": "string"
                        },
                        "nextPageCursor": {
                            "description": "Cursor which can be used for navigating to next page.",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "2: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/game-localization-roles/games/{gameId}
```json
{
    "Method": "PATCH",
    "Description": "Assigns or revokes a role",
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
            "name": "gameId",
            "format": "int64",
            "required": true,
            "description": "The id of the game"
        },
        "2": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The request body for update role endpoints",
                    "properties": {
                        "revoke": {
                            "description": "To assign or to revoke",
                            "type": "boolean"
                        },
                        "assigneeId": {
                            "format": "int64",
                            "description": "The id of the assignee",
                            "type": "integer"
                        },
                        "assigneeType": {
                            "enum": {
                                "1": "user",
                                "2": "group",
                                "3": "groupRole"
                            },
                            "description": "The type of the assignee",
                            "type": "string"
                        },
                        "role": {
                            "enum": {
                                "1": "translator"
                            },
                            "description": "The role to be assigned or revoked",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request body"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n1: You must be authorized to use this endpoint"
        },
        "400": {
            "description": "3: Invalid game id\r\n4: Invalid assignee id\r\n6: Request body can't be null\r\n7: The role you are assigning has reached max limit"
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
            "description": "5: Too many attempts. Please try again later."
        },
        "503": {
            "description": "2: Feature is disabled"
        }
    },
}
```
<hr>


## /v1/game-localization-roles/games/{gameId}/current-user/roles
```json
{
    "Method": "GET",
    "Description": "Retrieves the list of roles granted to current logged-in user",
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
            "description": "The id of the game"
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
                                "type": "string"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "503": {
            "description": "2: Feature is disabled"
        },
        "400": {
            "description": "3: Invalid game id"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


