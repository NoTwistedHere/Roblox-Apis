# <b>Groups Api v0</b>

## /v0/groups/{groupId}
```json
{
    "Method": "GET",
    "Description": "Retrieves information for the specified group ID.",
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
            "description": "The group id to fetch information for"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "Name": {
                            "type": "string"
                        },
                        "Description": {
                            "type": "string"
                        },
                        "Roles": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Name": {
                                            "type": "string"
                                        },
                                        "Rank": {
                                            "type": "integer",
                                            "format": "int32"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "Owner": {
                            "$ref": {
                                "properties": {
                                    "Name": {
                                        "type": "string"
                                    },
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "EmblemUrl": {
                            "type": "string"
                        },
                        "Id": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "1: Group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v0/groups/{groupId}/relationships
```json
{
    "Method": "GET",
    "Description": "Retrieves a paged list of allied or enemy groups.",
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
            "description": "The ID of the group"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "relationshipType",
            "enum": {
                "1": "Ally",
                "2": "Enemy"
            },
            "required": true,
            "description": "The group relationship type."
        },
        "3": {
            "in": "query",
            "type": "integer",
            "name": "page",
            "format": "int32",
            "description": "The page number to retrieve",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Returns a page of allied or enemy groups.",
                    "properties": {
                        "Groups": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Name": {
                                            "type": "string"
                                        },
                                        "Description": {
                                            "type": "string"
                                        },
                                        "Roles": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "Name": {
                                                            "type": "string"
                                                        },
                                                        "Rank": {
                                                            "type": "integer",
                                                            "format": "int32"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array"
                                        },
                                        "Owner": {
                                            "$ref": {
                                                "properties": {
                                                    "Name": {
                                                        "type": "string"
                                                    },
                                                    "Id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "EmblemUrl": {
                                            "type": "string"
                                        },
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "The related groups."
                        },
                        "FinalPage": {
                            "description": "Whether the request is the final page.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "1: Group is invalid or does not exist."
        }
    },
}
```
<hr>


## /v0/users/{userId}/groups
```json
{
    "Method": "GET",
    "Description": "Lists a user's groups.",
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
            "description": "The ID of the user"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "IsInClan": {
                                "type": "boolean"
                            },
                            "Role": {
                                "type": "string"
                            },
                            "Name": {
                                "type": "string"
                            },
                            "IsPrimary": {
                                "type": "boolean"
                            },
                            "Id": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "EmblemUrl": {
                                "type": "string"
                            },
                            "EmblemId": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "Rank": {
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
        "404": {
            "description": "3: The user is invalid or does not exist."
        }
    },
}
```
<hr>


