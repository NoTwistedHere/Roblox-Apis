# <b>PrivateMessages Api v1</b>

## /v1/messages/unread/count
```json
{
    "Method": "GET",
    "Description": "Gets unread messages for the authenticated user.",
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
                        "count": {
                            "type": "integer",
                            "format": "int32"
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
    "Internal": false
}
```
<hr>


## /v1/messages/archive
```json
{
    "Method": "POST",
    "Description": "Archives a batch of messages.",
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
                    "properties": {
                        "messageIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "batchMessagesRequest"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "failedMessages": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "messageId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "errorMessage": {
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
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "5: Too many ids in a batch request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/messages/{userId}/can-message
```json
{
    "Method": "GET",
    "Description": "Gets whether the sender can send a message to the specified user.",
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
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "canMessage": {
                            "description": "Boolean describing if the current user can message the specified user.",
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "8: Invalid user ID."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/messages
```json
{
    "Method": "GET",
    "Description": "Gets a user's messages.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "pageNumber",
            "format": "int32",
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "messageTab",
            "enum": {
                "1": "Inbox",
                "2": "Sent",
                "3": "Archive"
            },
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "collection": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A message details response.",
                                    "properties": {
                                        "recipient": {
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
                                            "description": "The recipient of the message."
                                        },
                                        "sender": {
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
                                            "description": "The sender of the message."
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The message's ID.",
                                            "type": "integer"
                                        },
                                        "body": {
                                            "description": "The body of the message.",
                                            "type": "string"
                                        },
                                        "updated": {
                                            "format": "date-time",
                                            "description": "When the message was last updated.",
                                            "type": "string"
                                        },
                                        "subject": {
                                            "description": "The subject of the message.",
                                            "type": "string"
                                        },
                                        "isSystemMessage": {
                                            "description": "Whether or not the message is a system message.",
                                            "type": "boolean"
                                        },
                                        "isReportAbuseDisplayed": {
                                            "description": "Whether or not the abuse report link is displayed for the message.",
                                            "type": "boolean"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "When the message was created.",
                                            "type": "string"
                                        },
                                        "isRead": {
                                            "description": "Whether or not the message has been read.",
                                            "type": "boolean"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "pageNumber": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "totalPages": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "totalCollectionSize": {
                            "type": "integer",
                            "format": "int32"
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
    "Internal": false
}
```
<hr>


## /v1/messages/mark-read
```json
{
    "Method": "POST",
    "Description": "Marks a batch of messages as read.",
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
                    "properties": {
                        "messageIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "batchMessagesRequest"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "failedMessages": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "messageId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "errorMessage": {
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
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "5: Too many ids in a batch request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/announcements
```json
{
    "Method": "GET",
    "Description": "Migrate from RobloxWebsite project, return news notification for Private Message page",
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
                        "collection": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "A message details response.",
                                    "properties": {
                                        "updated": {
                                            "format": "date-time",
                                            "description": "When the message was last updated.",
                                            "type": "string"
                                        },
                                        "sender": {
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
                                            "description": "The sender of the message."
                                        },
                                        "subject": {
                                            "description": "The subject of the message.",
                                            "type": "string"
                                        },
                                        "id": {
                                            "format": "int64",
                                            "description": "The message's ID.",
                                            "type": "integer"
                                        },
                                        "created": {
                                            "format": "date-time",
                                            "description": "When the message was created.",
                                            "type": "string"
                                        },
                                        "body": {
                                            "description": "The body of the message.",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array"
                        },
                        "totalCollectionSize": {
                            "type": "integer",
                            "format": "int32"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "400": {
            "description": "2: Message does not exist or the current user is not authorized to view it."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/announcements/metadata
```json
{
    "Method": "GET",
    "Description": ""NONE"",
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
                    "description": "A message details response.",
                    "properties": {
                        "numOfAnnouncements": {
                            "format": "int32",
                            "description": "Number of incoming news",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/messages/unarchive
```json
{
    "Method": "POST",
    "Description": "Unarchives a batch of messages.",
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
                    "properties": {
                        "messageIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "batchMessagesRequest"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "failedMessages": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "messageId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "errorMessage": {
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
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "5: Too many ids in a batch request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/messages/send
```json
{
    "Method": "POST",
    "Description": "Sends a message to a specified user.",
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
                    "properties": {
                        "replyMessageId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "subject": {
                            "type": "string"
                        },
                        "includePreviousMessage": {
                            "type": "boolean"
                        },
                        "body": {
                            "type": "string"
                        },
                        "userId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "recipientId": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "sendMessageRequest"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "message": {
                            "type": "string"
                        },
                        "success": {
                            "type": "boolean"
                        },
                        "shortMessage": {
                            "type": "string"
                        }
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
    "Internal": false
}
```
<hr>


## /v1/messages/{messageId}
```json
{
    "Method": "GET",
    "Description": "Gets a message's details.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "messageId",
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
                    "description": "A message details response.",
                    "properties": {
                        "recipient": {
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
                            "description": "The recipient of the message."
                        },
                        "sender": {
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
                            "description": "The sender of the message."
                        },
                        "id": {
                            "format": "int64",
                            "description": "The message's ID.",
                            "type": "integer"
                        },
                        "body": {
                            "description": "The body of the message.",
                            "type": "string"
                        },
                        "updated": {
                            "format": "date-time",
                            "description": "When the message was last updated.",
                            "type": "string"
                        },
                        "subject": {
                            "description": "The subject of the message.",
                            "type": "string"
                        },
                        "isSystemMessage": {
                            "description": "Whether or not the message is a system message.",
                            "type": "boolean"
                        },
                        "isReportAbuseDisplayed": {
                            "description": "Whether or not the abuse report link is displayed for the message.",
                            "type": "boolean"
                        },
                        "created": {
                            "format": "date-time",
                            "description": "When the message was created.",
                            "type": "string"
                        },
                        "isRead": {
                            "description": "Whether or not the message has been read.",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "2: Message does not exist or the current user is not authorized to view it."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/messages/mark-unread
```json
{
    "Method": "POST",
    "Description": "Marks a batch of messages as unread.",
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
                    "properties": {
                        "messageIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "batchMessagesRequest"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "failedMessages": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "messageId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "errorMessage": {
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
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "5: Too many ids in a batch request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


