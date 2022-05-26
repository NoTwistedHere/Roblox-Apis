# <b>Discussions Api v1</b>

## /v1/channels/create
```json
{
    "Method": "POST",
    "Description": "Creates a new channel for a discussion",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The request model for the CreateChannel API endpoint",
                    "properties": {
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "Part of the request model for creating or updating a channel",
                                "properties": {
                                    "send": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Part of the request model for creating or updating a channel",
                                            "properties": {
                                                "id": {
                                                    "format": "int64",
                                                    "description": "Gets or sets the id for the permission group according to its type",
                                                    "type": "integer"
                                                },
                                                "type": {
                                                    "enum": {
                                                        "1": "GroupRoleSet"
                                                    },
                                                    "description": "Gets or sets the type for the permission group",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Gets or sets the permission groups for sending messages in the channel"
                                    },
                                    "read": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Part of the request model for creating or updating a channel",
                                            "properties": {
                                                "id": {
                                                    "format": "int64",
                                                    "description": "Gets or sets the id for the permission group according to its type",
                                                    "type": "integer"
                                                },
                                                "type": {
                                                    "enum": {
                                                        "1": "GroupRoleSet"
                                                    },
                                                    "description": "Gets or sets the type for the permission group",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Gets or sets the permission groups for reading messages in the channel"
                                    }
                                }
                            },
                            "description": "Gets or sets the permissions configuration for the requested channel"
                        },
                        "title": {
                            "description": "Gets or sets the title for the requested channel",
                            "type": "string"
                        },
                        "discussionId": {
                            "format": "int64",
                            "description": "Gets or sets the discussion id for the requested channel",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The request model"
        }
    },
    "Responses": {
        "500": {
            "description": "1: An unknown problem occurred"
        },
        "400": {
            "description": "4: Missing request model\r\n5: Invalid title\r\n6: Title was filtered\r\n7: A channel with the same name already exists\r\n9: Invalid channel permissions configuration"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Basic details about a newly created channel",
                    "properties": {
                        "id": {
                            "description": "Gets or sets the Id of the channel",
                            "type": "string"
                        },
                        "title": {
                            "description": "Gets or sets the title of the channel",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "12: Discussions is not enabled for a given user"
        },
        "404": {
            "description": "3: Invalid discussion"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user does not have the appropriate permissions to perform an action\r\n8: Maximum number of channels already exists for the discussion"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/channels
```json
{
    "Method": "GET",
    "Description": "Gets a list of channels for each discussion id given",
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
            "description": "A comma-separated list of discussion ids",
            "name": "discussionIds"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "limit",
            "format": "int32",
            "required": true,
            "description": "The maximum number of channels to get for each discussion"
        }
    },
    "Responses": {
        "403": {
            "description": "2: The user does not have the appropriate permissions to perform an action"
        },
        "400": {
            "description": "3: Invalid discussion"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "A channel list for a particular discussion",
                        "properties": {
                            "channels": {
                                "items": {
                                    "$ref": {
                                        "type": "object",
                                        "description": "Basic details about a channel",
                                        "properties": {
                                            "id": {
                                                "description": "Gets or sets the Id of the channel",
                                                "type": "string"
                                            },
                                            "title": {
                                                "description": "Gets or sets the title of the channel",
                                                "type": "string"
                                            },
                                            "permissions": {
                                                "$ref": {
                                                    "type": "object",
                                                    "description": "Simple read/send permissions data for a user for a given channel",
                                                    "properties": {
                                                        "canRead": {
                                                            "description": "Gets or sets a value indicating whether the user can read messages from the channel",
                                                            "type": "boolean"
                                                        },
                                                        "canSend": {
                                                            "description": "Gets or sets a value indicating whether the user can send messages to the channel",
                                                            "type": "boolean"
                                                        }
                                                    }
                                                },
                                                "description": "Gets or sets the permissions of the channel for the user"
                                            }
                                        }
                                    }
                                },
                                "type": "array",
                                "description": "Gets or sets the channels for the discussion"
                            },
                            "discussionId": {
                                "format": "int64",
                                "description": "Gets or sets the discussion Id for this list",
                                "type": "integer"
                            }
                        }
                    }
                },
                "type": "array"
            }
        },
        "503": {
            "description": "12: Discussions is not enabled for a given user"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/channels/{channelId}/report
```json
{
    "Method": "POST",
    "Description": "Reports the given channel",
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
            "type": "string",
            "name": "channelId",
            "required": true,
            "description": "The id of the channel to report"
        },
        "2": {
            "in": "body",
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The request model for reporting a channel",
                    "properties": {
                        "reportMessage": {
                            "description": "Gets or sets the user-entered report message",
                            "type": "string"
                        },
                        "reportType": {
                            "description": "Gets or sets the type of report being made",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The report request model"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "4: Missing request model"
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
        "503": {
            "description": "12: Discussions is not enabled for a given user"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/channels/{channelId}
```json
{
    "Method": "DELETE",
    "Description": "Deletes a channel",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "channelId",
            "required": true,
            "description": "The id of the channel to delete"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user does not have the appropriate permissions to perform an action"
        },
        "503": {
            "description": "12: Discussions is not enabled for a given user"
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
        "404": {
            "description": "10: Invalid channel\r\n11: Channel already deleted"
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "PATCH",
    "Description": "Updates an existing channel",
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
            "type": "string",
            "name": "channelId",
            "required": true,
            "description": "The id of the channel to update"
        },
        "2": {
            "in": "body",
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The request model for the CreateChannel API endpoint",
                    "properties": {
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "Part of the request model for creating or updating a channel",
                                "properties": {
                                    "send": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Part of the request model for creating or updating a channel",
                                            "properties": {
                                                "id": {
                                                    "format": "int64",
                                                    "description": "Gets or sets the id for the permission group according to its type",
                                                    "type": "integer"
                                                },
                                                "type": {
                                                    "enum": {
                                                        "1": "GroupRoleSet"
                                                    },
                                                    "description": "Gets or sets the type for the permission group",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Gets or sets the permission groups for sending messages in the channel"
                                    },
                                    "read": {
                                        "$ref": {
                                            "type": "object",
                                            "description": "Part of the request model for creating or updating a channel",
                                            "properties": {
                                                "id": {
                                                    "format": "int64",
                                                    "description": "Gets or sets the id for the permission group according to its type",
                                                    "type": "integer"
                                                },
                                                "type": {
                                                    "enum": {
                                                        "1": "GroupRoleSet"
                                                    },
                                                    "description": "Gets or sets the type for the permission group",
                                                    "type": "string"
                                                }
                                            }
                                        },
                                        "description": "Gets or sets the permission groups for reading messages in the channel"
                                    }
                                }
                            },
                            "description": "Gets or sets the permissions configuration for the requested channel"
                        },
                        "title": {
                            "description": "Gets or sets the title for the requested channel",
                            "type": "string"
                        },
                        "discussionId": {
                            "format": "int64",
                            "description": "Gets or sets the discussion id for the requested channel",
                            "type": "integer"
                        }
                    }
                }
            },
            "description": "The request model"
        }
    },
    "Responses": {
        "500": {
            "description": "1: An unknown problem occurred"
        },
        "400": {
            "description": "4: Missing request model\r\n5: Invalid title\r\n6: Title was filtered\r\n7: A channel with the same name already exists\r\n9: Invalid channel permissions configuration"
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
        "503": {
            "description": "12: Discussions is not enabled for a given user"
        },
        "404": {
            "description": "10: Invalid channel"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user does not have the appropriate permissions to perform an action"
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets the channel details for the given channel Id",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "channelId",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "403": {
            "description": "2: The user does not have the appropriate permissions to perform an action"
        },
        "503": {
            "description": "12: Discussions is not enabled for a given user"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Basic details about a channel",
                    "properties": {
                        "id": {
                            "description": "Gets or sets the Id of the channel",
                            "type": "string"
                        },
                        "title": {
                            "description": "Gets or sets the title of the channel",
                            "type": "string"
                        },
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "Simple read/send permissions data for a user for a given channel",
                                "properties": {
                                    "canRead": {
                                        "description": "Gets or sets a value indicating whether the user can read messages from the channel",
                                        "type": "boolean"
                                    },
                                    "canSend": {
                                        "description": "Gets or sets a value indicating whether the user can send messages to the channel",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Gets or sets the permissions of the channel for the user"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "10: Invalid channel"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/channels/{channelId}/messages
```json
{
    "Method": "POST",
    "Description": "Sends a message in a channel.",
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
            "type": "string",
            "name": "channelId",
            "required": true,
            "description": "The channel id."
        },
        "2": {
            "in": "body",
            "name": "sendMessageRequest",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "message": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The message to send."
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n3: Insufficient permissions.\r\n5: Privacy settings are too strict."
        },
        "400": {
            "description": "1: Invalid channel.\r\n6: Text is filtered.\r\n7: Text is too long.\r\n8: Text is missing.\r\n9: Text is too short."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "created": {
                            "type": "string",
                            "format": "date-time"
                        },
                        "isDeleted": {
                            "type": "boolean"
                        },
                        "id": {
                            "type": "string"
                        },
                        "messageChunks": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "message": {
                                            "type": "string"
                                        },
                                        "type": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array"
                        },
                        "messageText": {
                            "type": "string"
                        },
                        "sender": {
                            "$ref": {
                                "properties": {
                                    "type": {
                                        "type": "string",
                                        "enum": {
                                            "1": "User"
                                        }
                                    },
                                    "name": {
                                        "type": "string"
                                    },
                                    "targetId": {
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
            }
        },
        "429": {
            "description": "4: Too many requests."
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "GET",
    "Description": "Gets a list of messages in a channel.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "channelId",
            "required": true,
            "description": "The channel id."
        },
        "2": {
            "in": "query",
            "type": "string",
            "default": "Asc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by message date",
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
                                    "properties": {
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "isDeleted": {
                                            "type": "boolean"
                                        },
                                        "id": {
                                            "type": "string"
                                        },
                                        "messageChunks": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "message": {
                                                            "type": "string"
                                                        },
                                                        "type": {
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array"
                                        },
                                        "messageText": {
                                            "type": "string"
                                        },
                                        "sender": {
                                            "$ref": {
                                                "properties": {
                                                    "type": {
                                                        "type": "string",
                                                        "enum": {
                                                            "1": "User"
                                                        }
                                                    },
                                                    "name": {
                                                        "type": "string"
                                                    },
                                                    "targetId": {
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
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "3: Insufficient permissions."
        },
        "400": {
            "description": "1: Invalid channel."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/discussions
```json
{
    "Method": "GET",
    "Description": "Gets details regarding a list of discussions that the user is in",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
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
                                    "description": "The response model for sending data about a discussion",
                                    "properties": {
                                        "enabled": {
                                            "description": "Gets or sets a value indicating whether the discussion is enabled",
                                            "type": "boolean"
                                        },
                                        "type": {
                                            "enum": {
                                                "1": "Group"
                                            },
                                            "description": "Gets or sets the type for the discussion",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Gets or sets the name for the discussion",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "Gets or sets the Id for the discussion",
                                            "type": "integer"
                                        },
                                        "permissions": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "The response model for sending data about a user's permissions",
                                                "properties": {
                                                    "canManage": {
                                                        "description": "Gets or sets a value indicating whether the user can manage the discussion",
                                                        "type": "boolean"
                                                    },
                                                    "canModerate": {
                                                        "description": "Gets or sets a value indicating whether the user can moderate the discussion",
                                                        "type": "boolean"
                                                    }
                                                }
                                            },
                                            "description": "Gets or sets the permissions for the authenticated user for this discussion"
                                        },
                                        "targetId": {
                                            "format": "int64",
                                            "description": "Gets or sets the target Id for the discussion",
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
        "503": {
            "description": "2: Discussions is not enabled for a given user"
        },
        "400": {
            "description": "8: The cursor value was invalid"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/channels/{channelId}/messages/{messageId}
```json
{
    "Method": "DELETE",
    "Description": "Deletes a message.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "channelId",
            "required": true,
            "description": "The channel id."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "messageId",
            "required": true,
            "description": "The message id to delete."
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
            "description": "0: Token Validation Failed\r\n3: Insufficient permissions."
        },
        "400": {
            "description": "1: Invalid channel.\r\n2: Invalid message."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/discussions/subscribe
```json
{
    "Method": "POST",
    "Description": "Subscribes the authenticated user to real time notifications for all their discussions",
    "Consumes": "NONE",
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
                "type": "string"
            },
            "required": true,
            "name": "channels"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for subscribing to real time notifications",
                    "properties": {
                        "subscribeReceipt": {
                            "description": "Gets or sets the subscribe receipt",
                            "type": "string"
                        }
                    }
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
    "Internal": false
}
```
<hr>


## /v1/discussions/metadata
```json
{
    "Method": "GET",
    "Description": "Gets global information about the state of Discussions for a particular user, including roll-out settings",
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
                    "description": "Global information about the state of Discussions for a particular user, including roll-out settings",
                    "properties": {
                        "discussionsEnabledForUser": {
                            "description": "Gets a value indicating whether the user is allowed to access Discussions at all\r\nDetermined using a roll-out setting from Platform.Discussions",
                            "type": "boolean"
                        },
                        "privacySettingsAllowSending": {
                            "description": "Gets a value indicating whether the user is allowed to send messages\r\nDetermined from the user's \"Is Account Restricted\" setting",
                            "type": "boolean"
                        }
                    }
                }
            }
        }
    },
    "Internal": false
}
```
<hr>


## /v1/discussions/{discussionType}/{targetId}
```json
{
    "Method": "GET",
    "Description": "Gets details regarding a particular discussion",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "discussionType",
            "enum": {
                "1": "Group"
            },
            "required": true,
            "description": ""
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "targetId",
            "format": "int64",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for sending data about a discussion",
                    "properties": {
                        "enabled": {
                            "description": "Gets or sets a value indicating whether the discussion is enabled",
                            "type": "boolean"
                        },
                        "type": {
                            "enum": {
                                "1": "Group"
                            },
                            "description": "Gets or sets the type for the discussion",
                            "type": "string"
                        },
                        "name": {
                            "description": "Gets or sets the name for the discussion",
                            "type": "string"
                        },
                        "id": {
                            "format": "int64",
                            "description": "Gets or sets the Id for the discussion",
                            "type": "integer"
                        },
                        "permissions": {
                            "$ref": {
                                "type": "object",
                                "description": "The response model for sending data about a user's permissions",
                                "properties": {
                                    "canManage": {
                                        "description": "Gets or sets a value indicating whether the user can manage the discussion",
                                        "type": "boolean"
                                    },
                                    "canModerate": {
                                        "description": "Gets or sets a value indicating whether the user can moderate the discussion",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Gets or sets the permissions for the authenticated user for this discussion"
                        },
                        "targetId": {
                            "format": "int64",
                            "description": "Gets or sets the target Id for the discussion",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "503": {
            "description": "2: Discussions is not enabled for a given user"
        },
        "400": {
            "description": "7: The discussion does not exist"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/discussions/create
```json
{
    "Method": "POST",
    "Description": "Creates a new Discussion",
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
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The request model for the CreateDiscussion API endpoint",
                    "properties": {
                        "targetId": {
                            "format": "int64",
                            "description": "Gets or sets the target Id for the requested discussion",
                            "type": "integer"
                        },
                        "type": {
                            "enum": {
                                "1": "Group"
                            },
                            "description": "Gets or sets the type for the requested discussion",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The request model"
        }
    },
    "Responses": {
        "500": {
            "description": "1: An unknown problem occurred"
        },
        "400": {
            "description": "3: The request model was null\r\n4: A platform argument exception was raised\r\n5: The discussion already exists\r\n6: The target does not exist"
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
        "503": {
            "description": "2: Discussions is not enabled for a given user"
        },
        "403": {
            "description": "0: Token Validation Failed\r\n9: The user does not have the appropriate permissions to perform an action"
        }
    },
    "Internal": false
}
```
<hr>


