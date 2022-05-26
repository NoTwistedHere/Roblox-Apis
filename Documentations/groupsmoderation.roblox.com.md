# <b>GroupsModeration Api v1</b>

## /v1/groups/{groupId}/wall/posts
```json
{
    "Method": "POST",
    "Description": "Deletes a list of wall posts from a specific group",
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
            "name": "groupId",
            "format": "int64",
            "required": true,
            "description": "The group id."
        },
        "2": {
            "in": "body",
            "name": "deleteWallPostsRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "WallPostIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "Collection of wall post ids from a group"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "{Roblox.GroupsModeration.Api.DeleteWallPostsRequest}."
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
        }
    },
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets a list of wall posts from a specific group",
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
            "description": "The group id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by group wall post Id",
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
                                    "description": "A response model for group wall post information",
                                    "properties": {
                                        "updated": {
                                            "format": "date-time",
                                            "description": "When the group wall post was last updated.",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The group wall post Id.",
                                            "type": "integer"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "When the group wall post was posted.",
                                            "type": "string"
                                        },
                                        "body": {
                                            "description": "The group wall post body.",
                                            "type": "string"
                                        },
                                        "poster": {
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
                                            },
                                            "description": "The user that posted the group wall post."
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
        }
    },
}
```
<hr>


