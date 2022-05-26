# <b>ChatModeration Api v1</b>

## /v1/users/{userId}/conversations
```json
{
    "Method": "GET",
    "Description": "Retrieve all the conversations for a user.",
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
            "description": "the user's Id"
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
                                    "description": "Response model for a conversation from the GetUserConversations endpoint.",
                                    "properties": {
                                        "updated": {
                                            "format": "date-time",
                                            "description": "Gets or sets the updated time of the conversation.",
                                            "type": "string"
                                        },
                                        "conversationStatus": {
                                            "enum": {
                                                "1": "Unread",
                                                "2": "Read"
                                            },
                                            "description": "Gets or sets conversation status.",
                                            "type": "string"
                                        },
                                        "title": {
                                            "description": "Gets or sets conversation title.",
                                            "type": "string"
                                        },
                                        "initiator": {
                                            "$ref": {
                                                "properties": {
                                                    "targetId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "participantType": {
                                                        "type": "string",
                                                        "enum": {
                                                            "1": "User"
                                                        }
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "Gets or sets the initiator who starts the conversation."
                                        },
                                        "pinnedUniverseId": {
                                            "format": "int64",
                                            "description": "Gets or sets the universe id of pinned game in the conversation.",
                                            "type": "integer"
                                        },
                                        "conversationType": {
                                            "enum": {
                                                "1": "OneToOneConversation",
                                                "2": "MultiUserConversation",
                                                "3": "CloudEditConversation",
                                                "4": "DiscussionChannelConversation",
                                                "5": "TalentHubConversation"
                                            },
                                            "description": "Gets or sets the conversation type.",
                                            "type": "string"
                                        },
                                        "participants": {
                                            "items": {
                                                "$ref": {
                                                    "properties": {
                                                        "targetId": {
                                                            "type": "integer",
                                                            "format": "int64"
                                                        },
                                                        "participantType": {
                                                            "type": "string",
                                                            "enum": {
                                                                "1": "User"
                                                            }
                                                        }
                                                    },
                                                    "type": "object"
                                                }
                                            },
                                            "type": "array",
                                            "description": "Gets or sets participants of the conversation."
                                        },
                                        "conversationId": {
                                            "format": "int64",
                                            "description": "Gets or sets the conversation id.",
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
        "400": {
            "description": "1: Invalid user id"
        },
        "401": {
            "description": "3: The User has insufficient permissions to perform this action"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/users/{userId}/conversations/{conversationId}/messages
```json
{
    "Method": "GET",
    "Description": "Gets messages from a conversation.",
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
            "in": "path",
            "type": "integer",
            "name": "conversationId",
            "format": "int64",
            "required": true,
            "description": "the conversation id"
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
        },
        "5": {
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
                                    "type": "object",
                                    "description": "Response model for a chat message",
                                    "properties": {
                                        "actorUserId": {
                                            "format": "int64",
                                            "description": "Gets or sets the actor user id for set universe event messages",
                                            "type": "integer"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "Gets or sets the universe id for game link messages and set universe events",
                                            "type": "integer"
                                        },
                                        "id": {
                                            "type": "string",
                                            "format": "uuid",
                                            "description": "Gets or sets Unique identifier for the message.",
                                            "example": "00000000-0000-0000-0000-000000000000"
                                        },
                                        "sent": {
                                            "format": "date-time",
                                            "description": "Gets or sets the instant at which the message was sent",
                                            "type": "string"
                                        },
                                        "messageSource": {
                                            "enum": {
                                                "1": "User",
                                                "2": "System"
                                            },
                                            "description": "Gets or sets the source who sent the message",
                                            "type": "string"
                                        },
                                        "read": {
                                            "description": "Gets or sets a value indicating whether or not the message has been read by the viewer requesting this message",
                                            "type": "boolean"
                                        },
                                        "decorators": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array",
                                            "description": "Gets or sets A list of decorators"
                                        },
                                        "senderId": {
                                            "format": "int64",
                                            "description": "Gets or sets the sender id for user messages (plaintext or link messages)",
                                            "type": "integer"
                                        },
                                        "content": {
                                            "description": "Gets or sets the message content for plaintext messages",
                                            "type": "string"
                                        },
                                        "messageType": {
                                            "enum": {
                                                "1": "PlainText",
                                                "2": "Link",
                                                "3": "EventBased"
                                            },
                                            "description": "Gets or sets the message type.",
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
            "description": "1: Invalid user id\r\n2: Invalid conversation id"
        },
        "401": {
            "description": "3: The User has insufficient permissions to perform this action"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/users/{userId}/conversations/{conversationId}/export
```json
{
    "Method": "GET",
    "Description": "Exports chat conversation messages to csv file.",
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
            "description": "The target user id."
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "conversationId",
            "format": "int64",
            "required": true,
            "description": "The conversation id."
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "inclusiveStartDate",
            "description": "",
        },
        "4": {
            "in": "query",
            "type": "string",
            "name": "exclusiveEndDate",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        },
        "500": {
            "description": "3: Processing error has occured."
        },
        "400": {
            "description": "0: Conversation is not valid.\r\n1: User is not valid."
        },
        "401": {
            "description": "2: User is not authorized to export user platform chat."
        }
    },
    "Internal": true
}
```
<hr>


