# <b>Chat Api v2</b>

## /v2/reset-conversation-universe
```json
{
    "Method": "POST",
    "Description": "Removes universe associated with a conversation",
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
                    "properties": {
                        "conversationId": {
                            "format": "int64",
                            "description": "Conversation id to remove universe from",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
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


## /v2/get-rollout-settings
```json
{
    "Method": "GET",
    "Description": "Gets the rollout settings for requested feature",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "type": "string"
            },
            "required": true,
            "description": "string array to request feature rollout settings",
            "name": "featureNames"
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "rolloutFeatures": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "isRolloutEnabled": {
                                            "description": "Is the feature enabled to be rolledout",
                                            "type": "boolean"
                                        },
                                        "featureName": {
                                            "enum": {
                                                "1": "LuaChat",
                                                "2": "ConversationUniverse",
                                                "3": "PlayTogether",
                                                "4": "Party",
                                                "5": "GameLink",
                                                "6": "OldPlayTogether"
                                            },
                                            "description": "Feature name strings for rollout settings",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "List of rollout features"
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


## /v2/start-one-to-one-conversation
```json
{
    "Method": "POST",
    "Description": "Creates a new one-on-one conversation",
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
                    "properties": {
                        "participantUserId": {
                            "format": "int64",
                            "description": "Participant user id to create 1-1 conversation.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
                            "type": "string"
                        },
                        "rejectedParticipants": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "type": {
                                            "enum": {
                                                "1": "User",
                                                "2": "System"
                                            },
                                            "description": "Type of a chat participant",
                                            "type": "string"
                                        },
                                        "rejectedReason": {
                                            "description": "Reason as to why the chat participant was rejected to be a part of the conversation",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Name of the chat participant",
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "format": "int64",
                                            "description": "Id of the chat participant",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "display name of the chat participant",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "List of chat participants who were rejected to be part of the associated conversation"
                        },
                        "resultType": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Status of the response",
                            "type": "string"
                        },
                        "conversation": {
                            "$ref": {
                                "properties": {
                                    "participants": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "name": {
                                                        "description": "Name of the chat participant",
                                                        "type": "string"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "System"
                                                        },
                                                        "description": "Type of a chat participant",
                                                        "type": "string"
                                                    },
                                                    "targetId": {
                                                        "format": "int64",
                                                        "description": "Id of the chat participant",
                                                        "type": "integer"
                                                    },
                                                    "displayName": {
                                                        "description": "display name of the chat participant",
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array",
                                        "description": "Participants involved in the conversation"
                                    },
                                    "initiator": {
                                        "$ref": {
                                            "properties": {
                                                "name": {
                                                    "description": "Name of the chat participant",
                                                    "type": "string"
                                                },
                                                "type": {
                                                    "enum": {
                                                        "1": "User",
                                                        "2": "System"
                                                    },
                                                    "description": "Type of a chat participant",
                                                    "type": "string"
                                                },
                                                "targetId": {
                                                    "format": "int64",
                                                    "description": "Id of the chat participant",
                                                    "type": "integer"
                                                },
                                                "displayName": {
                                                    "description": "display name of the chat participant",
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Conversation initiator entity"
                                    },
                                    "id": {
                                        "format": "int64",
                                        "description": "Chat conversation Id",
                                        "type": "integer"
                                    },
                                    "conversationType": {
                                        "enum": {
                                            "1": "OneToOneConversation",
                                            "2": "MultiUserConversation",
                                            "3": "CloudEditConversation"
                                        },
                                        "description": "Type of the conversation",
                                        "type": "string"
                                    },
                                    "title": {
                                        "description": "Chat conversation title",
                                        "type": "string"
                                    },
                                    "conversationUniverse": {
                                        "$ref": {
                                            "properties": {
                                                "rootPlaceId": {
                                                    "format": "int64",
                                                    "description": "Id Corresponding to the root place of the universe",
                                                    "type": "integer"
                                                },
                                                "universeId": {
                                                    "format": "int64",
                                                    "description": "Id corresponding to the universe",
                                                    "type": "integer"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Specifies the universe associated with the conversation"
                                    },
                                    "lastUpdated": {
                                        "format": "date-time",
                                        "description": "Specifies the datetime when the conversation was last updated",
                                        "type": "string"
                                    },
                                    "conversationTitle": {
                                        "$ref": {
                                            "properties": {
                                                "isDefaultTitle": {
                                                    "description": "Specifies if the title displayed for the user is generated as a default title in the backend or was custom assigned by the user.",
                                                    "type": "boolean"
                                                },
                                                "titleForViewer": {
                                                    "description": "Specifies the title for the conversation specific to the viewer",
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Specifies if the conversation title is generated by default."
                                    },
                                    "hasUnreadMessages": {
                                        "description": "Does the conversation have any unread messages",
                                        "type": "boolean"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The newly created conversation"
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


## /v2/mark-as-seen
```json
{
    "Method": "POST",
    "Description": "Mark the specified conversation messages as seen",
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
                    "properties": {
                        "conversationsToMarkSeen": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The conversation ids to be marked as seen."
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "resultType": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Status of the response",
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


## /v2/send-game-link-message
```json
{
    "Method": "POST",
    "Description": ""NONE"",
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
                        "decorators": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "The decorators to attach to the new message."
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "The message to be sent.",
                            "type": "integer"
                        },
                        "conversationId": {
                            "format": "int64",
                            "description": "The conversation Id to send mesage to.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "requestModel"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "messageId": {
                            "description": "Id of the chat message being sent",
                            "type": "string"
                        },
                        "chatMessageLinkType": {
                            "type": "string",
                            "enum": {
                                "1": "Game"
                            }
                        },
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
                            "type": "string"
                        },
                        "sent": {
                            "format": "date-time",
                            "description": "DateTime of when the message was sent",
                            "type": "string"
                        },
                        "resultType": {
                            "enum": {
                                "1": "Success",
                                "2": "Moderated",
                                "3": "TextTooLong",
                                "4": "NoRealtimeConnection"
                            },
                            "description": "Status of the response",
                            "type": "string"
                        },
                        "messageType": {
                            "enum": {
                                "1": "PlainText",
                                "2": "Link",
                                "3": "EventBased"
                            },
                            "description": "Type of the chat message being sent",
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


## /v2/get-unread-messages
```json
{
    "Method": "GET",
    "Description": "Gets the unread messages for the conversationIds specified in the parameters",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "",
            "name": "conversationIds"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "conversationId": {
                                "format": "int64",
                                "description": "Conversation Id to get multiple conversations",
                                "type": "integer"
                            },
                            "chatMessages": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "senderType": {
                                                "enum": {
                                                    "1": "User",
                                                    "2": "System"
                                                },
                                                "description": "Type of the chat message sender",
                                                "type": "string"
                                            },
                                            "link": {
                                                "$ref": {
                                                    "properties": {
                                                        "game": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "universeId": {
                                                                        "format": "int64",
                                                                        "description": "The universeId for game link chat message",
                                                                        "type": "integer"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "description": "The game link model"
                                                        },
                                                        "type": {
                                                            "enum": {
                                                                "1": "Game"
                                                            },
                                                            "description": "The chat message link type",
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "description": "The link chat message"
                                            },
                                            "id": {
                                                "type": "string",
                                                "format": "uuid",
                                                "description": "Id of the chat message",
                                                "example": "00000000-0000-0000-0000-000000000000"
                                            },
                                            "sent": {
                                                "format": "date-time",
                                                "description": "The dateTime when the chat message was sent",
                                                "type": "string"
                                            },
                                            "senderTargetId": {
                                                "format": "int64",
                                                "description": "Id of the entity that has sent the chat message",
                                                "type": "integer"
                                            },
                                            "read": {
                                                "description": "Is the chat message read",
                                                "type": "boolean"
                                            },
                                            "decorators": {
                                                "items": {
                                                    "type": "string"
                                                },
                                                "type": "array",
                                                "description": "Decorators for the chat message"
                                            },
                                            "eventBased": {
                                                "$ref": {
                                                    "properties": {
                                                        "setConversationUniverse": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "actorUserId": {
                                                                        "format": "int64",
                                                                        "description": "The UserId for the user who setConversationUniverse",
                                                                        "type": "integer"
                                                                    },
                                                                    "universeId": {
                                                                        "format": "int64",
                                                                        "description": "The universeId for SetConversationUniverse EventBased ChatMessage",
                                                                        "type": "integer"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "description": "The set conversation universe event based model"
                                                        },
                                                        "type": {
                                                            "enum": {
                                                                "1": "SetConversationUniverse"
                                                            },
                                                            "description": "The chat message event type",
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "description": "The eventBased chat message"
                                            },
                                            "content": {
                                                "description": "The chat mesage itself",
                                                "type": "string"
                                            },
                                            "messageType": {
                                                "enum": {
                                                    "1": "PlainText",
                                                    "2": "Link",
                                                    "3": "EventBased"
                                                },
                                                "description": "Type of the chat message",
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "description": "Chat messages associated with the conversation"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
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


## /v2/metadata
```json
{
    "Method": "GET",
    "Description": "Get Chat metadata.",
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
                    "description": "Chat Metadata Response Model",
                    "properties": {
                        "isConnectTabEnabled": {
                            "type": "boolean"
                        },
                        "isInvalidMessageTypeFallbackEnabled": {
                            "type": "boolean"
                        },
                        "isVoiceChatForClientSideEnabled": {
                            "type": "boolean"
                        },
                        "shouldRespectConversationHasUnreadMessageToMarkAsRead": {
                            "type": "boolean"
                        },
                        "senderTypesForUnknownMessageTypeError": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array"
                        },
                        "isPlayTogetherForGameCardsEnabled": {
                            "type": "boolean"
                        },
                        "typingInChatForReceiverExpirationMs": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "maxConversationTitleLength": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "validMessageTypesWhiteList": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array"
                        },
                        "isRoactChatEnabled": {
                            "type": "boolean"
                        },
                        "signalRDisconnectionResponseInMilliseconds": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "isChatDataFromLocalStorageEnabled": {
                            "type": "boolean"
                        },
                        "partyChromeDisplayTimeStampInterval": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "isChatEnabledByPrivacySetting": {
                            "type": "string",
                            "enum": {
                                "1": "Disabled",
                                "2": "Enabled",
                                "3": "Unavailable"
                            }
                        },
                        "isAliasChatForClientSideEnabled": {
                            "type": "boolean"
                        },
                        "numberOfMembersForPartyChrome": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "languageForPrivacySettingUnavailable": {
                            "type": "string"
                        },
                        "relativeValueToRecordUiPerformance": {
                            "type": "number",
                            "format": "double"
                        },
                        "chatDataFromLocalStorageExpirationSeconds": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "isUsingCacheToLoadFriendsInfoEnabled": {
                            "type": "boolean"
                        },
                        "isRespectingMessageTypeEnabled": {
                            "type": "boolean"
                        },
                        "cachedDataFromLocalStorageExpirationMS": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "typingInChatFromSenderThrottleMs": {
                            "type": "integer",
                            "format": "int32"
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


## /v2/multi-get-latest-messages
```json
{
    "Method": "GET",
    "Description": "Gets latest messages corresponding to the given list of conversation Ids",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "",
            "name": "conversationIds"
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "conversationId": {
                                "format": "int64",
                                "description": "Conversation Id to get multiple conversations",
                                "type": "integer"
                            },
                            "chatMessages": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "senderType": {
                                                "enum": {
                                                    "1": "User",
                                                    "2": "System"
                                                },
                                                "description": "Type of the chat message sender",
                                                "type": "string"
                                            },
                                            "link": {
                                                "$ref": {
                                                    "properties": {
                                                        "game": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "universeId": {
                                                                        "format": "int64",
                                                                        "description": "The universeId for game link chat message",
                                                                        "type": "integer"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "description": "The game link model"
                                                        },
                                                        "type": {
                                                            "enum": {
                                                                "1": "Game"
                                                            },
                                                            "description": "The chat message link type",
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "description": "The link chat message"
                                            },
                                            "id": {
                                                "type": "string",
                                                "format": "uuid",
                                                "description": "Id of the chat message",
                                                "example": "00000000-0000-0000-0000-000000000000"
                                            },
                                            "sent": {
                                                "format": "date-time",
                                                "description": "The dateTime when the chat message was sent",
                                                "type": "string"
                                            },
                                            "senderTargetId": {
                                                "format": "int64",
                                                "description": "Id of the entity that has sent the chat message",
                                                "type": "integer"
                                            },
                                            "read": {
                                                "description": "Is the chat message read",
                                                "type": "boolean"
                                            },
                                            "decorators": {
                                                "items": {
                                                    "type": "string"
                                                },
                                                "type": "array",
                                                "description": "Decorators for the chat message"
                                            },
                                            "eventBased": {
                                                "$ref": {
                                                    "properties": {
                                                        "setConversationUniverse": {
                                                            "$ref": {
                                                                "properties": {
                                                                    "actorUserId": {
                                                                        "format": "int64",
                                                                        "description": "The UserId for the user who setConversationUniverse",
                                                                        "type": "integer"
                                                                    },
                                                                    "universeId": {
                                                                        "format": "int64",
                                                                        "description": "The universeId for SetConversationUniverse EventBased ChatMessage",
                                                                        "type": "integer"
                                                                    }
                                                                },
                                                                "type": "object"
                                                            },
                                                            "description": "The set conversation universe event based model"
                                                        },
                                                        "type": {
                                                            "enum": {
                                                                "1": "SetConversationUniverse"
                                                            },
                                                            "description": "The chat message event type",
                                                            "type": "string"
                                                        }
                                                    },
                                                    "type": "object"
                                                },
                                                "description": "The eventBased chat message"
                                            },
                                            "content": {
                                                "description": "The chat mesage itself",
                                                "type": "string"
                                            },
                                            "messageType": {
                                                "enum": {
                                                    "1": "PlainText",
                                                    "2": "Link",
                                                    "3": "EventBased"
                                                },
                                                "description": "Type of the chat message",
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "description": "Chat messages associated with the conversation"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
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


## /v2/update-user-typing-status
```json
{
    "Method": "POST",
    "Description": "Updates the status for whether a user is typing currently",
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
                    "properties": {
                        "isTyping": {
                            "description": "isTyping flag to indicate if user has started typing or stopped.",
                            "type": "boolean"
                        },
                        "conversationId": {
                            "format": "int64",
                            "description": "The Conversation id in which user is typing.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
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


## /v2/get-unread-conversation-count
```json
{
    "Method": "GET",
    "Description": "Gets the count of unread conversations",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "count": {
                            "type": "integer",
                            "format": "int64"
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


## /v2/start-group-conversation
```json
{
    "Method": "POST",
    "Description": "Creates a new group conversation",
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
                    "properties": {
                        "participantUserIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "Array of user id to create a group conversation with."
                        },
                        "title": {
                            "description": "Title of the new group conversation.",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
                            "type": "string"
                        },
                        "rejectedParticipants": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "type": {
                                            "enum": {
                                                "1": "User",
                                                "2": "System"
                                            },
                                            "description": "Type of a chat participant",
                                            "type": "string"
                                        },
                                        "rejectedReason": {
                                            "description": "Reason as to why the chat participant was rejected to be a part of the conversation",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Name of the chat participant",
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "format": "int64",
                                            "description": "Id of the chat participant",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "display name of the chat participant",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "List of chat participants who were rejected to be part of the associated conversation"
                        },
                        "resultType": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Status of the response",
                            "type": "string"
                        },
                        "conversation": {
                            "$ref": {
                                "properties": {
                                    "participants": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "name": {
                                                        "description": "Name of the chat participant",
                                                        "type": "string"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "System"
                                                        },
                                                        "description": "Type of a chat participant",
                                                        "type": "string"
                                                    },
                                                    "targetId": {
                                                        "format": "int64",
                                                        "description": "Id of the chat participant",
                                                        "type": "integer"
                                                    },
                                                    "displayName": {
                                                        "description": "display name of the chat participant",
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array",
                                        "description": "Participants involved in the conversation"
                                    },
                                    "initiator": {
                                        "$ref": {
                                            "properties": {
                                                "name": {
                                                    "description": "Name of the chat participant",
                                                    "type": "string"
                                                },
                                                "type": {
                                                    "enum": {
                                                        "1": "User",
                                                        "2": "System"
                                                    },
                                                    "description": "Type of a chat participant",
                                                    "type": "string"
                                                },
                                                "targetId": {
                                                    "format": "int64",
                                                    "description": "Id of the chat participant",
                                                    "type": "integer"
                                                },
                                                "displayName": {
                                                    "description": "display name of the chat participant",
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Conversation initiator entity"
                                    },
                                    "id": {
                                        "format": "int64",
                                        "description": "Chat conversation Id",
                                        "type": "integer"
                                    },
                                    "conversationType": {
                                        "enum": {
                                            "1": "OneToOneConversation",
                                            "2": "MultiUserConversation",
                                            "3": "CloudEditConversation"
                                        },
                                        "description": "Type of the conversation",
                                        "type": "string"
                                    },
                                    "title": {
                                        "description": "Chat conversation title",
                                        "type": "string"
                                    },
                                    "conversationUniverse": {
                                        "$ref": {
                                            "properties": {
                                                "rootPlaceId": {
                                                    "format": "int64",
                                                    "description": "Id Corresponding to the root place of the universe",
                                                    "type": "integer"
                                                },
                                                "universeId": {
                                                    "format": "int64",
                                                    "description": "Id corresponding to the universe",
                                                    "type": "integer"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Specifies the universe associated with the conversation"
                                    },
                                    "lastUpdated": {
                                        "format": "date-time",
                                        "description": "Specifies the datetime when the conversation was last updated",
                                        "type": "string"
                                    },
                                    "conversationTitle": {
                                        "$ref": {
                                            "properties": {
                                                "isDefaultTitle": {
                                                    "description": "Specifies if the title displayed for the user is generated as a default title in the backend or was custom assigned by the user.",
                                                    "type": "boolean"
                                                },
                                                "titleForViewer": {
                                                    "description": "Specifies the title for the conversation specific to the viewer",
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Specifies if the conversation title is generated by default."
                                    },
                                    "hasUnreadMessages": {
                                        "description": "Does the conversation have any unread messages",
                                        "type": "boolean"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The newly created conversation"
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


## /v2/chat-settings
```json
{
    "Method": "GET",
    "Description": "For every authenticated user, the clients hit this endpoint to get the chat related settings. Example : Chat is enabled or not",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "chatEnabled": {
                            "description": "Is chat enabled for the user",
                            "type": "boolean"
                        },
                        "isActiveChatUser": {
                            "description": "Was the Last ChatMessage Sent within the last x days or the account was created in the last x days?\r\nNote: user is active by default unless he does not chat for more than x days after account creation",
                            "type": "boolean"
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


## /v2/get-messages
```json
{
    "Method": "GET",
    "Description": "Gets messages corresponding to the given conversationId",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "integer",
            "name": "conversationId",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "exclusiveStartMessageId",
            "description": "",
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "senderType": {
                                "enum": {
                                    "1": "User",
                                    "2": "System"
                                },
                                "description": "Type of the chat message sender",
                                "type": "string"
                            },
                            "link": {
                                "$ref": {
                                    "properties": {
                                        "game": {
                                            "$ref": {
                                                "properties": {
                                                    "universeId": {
                                                        "format": "int64",
                                                        "description": "The universeId for game link chat message",
                                                        "type": "integer"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The game link model"
                                        },
                                        "type": {
                                            "enum": {
                                                "1": "Game"
                                            },
                                            "description": "The chat message link type",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "The link chat message"
                            },
                            "id": {
                                "type": "string",
                                "format": "uuid",
                                "description": "Id of the chat message",
                                "example": "00000000-0000-0000-0000-000000000000"
                            },
                            "sent": {
                                "format": "date-time",
                                "description": "The dateTime when the chat message was sent",
                                "type": "string"
                            },
                            "senderTargetId": {
                                "format": "int64",
                                "description": "Id of the entity that has sent the chat message",
                                "type": "integer"
                            },
                            "read": {
                                "description": "Is the chat message read",
                                "type": "boolean"
                            },
                            "decorators": {
                                "items": {
                                    "type": "string"
                                },
                                "type": "array",
                                "description": "Decorators for the chat message"
                            },
                            "eventBased": {
                                "$ref": {
                                    "properties": {
                                        "setConversationUniverse": {
                                            "$ref": {
                                                "properties": {
                                                    "actorUserId": {
                                                        "format": "int64",
                                                        "description": "The UserId for the user who setConversationUniverse",
                                                        "type": "integer"
                                                    },
                                                    "universeId": {
                                                        "format": "int64",
                                                        "description": "The universeId for SetConversationUniverse EventBased ChatMessage",
                                                        "type": "integer"
                                                    }
                                                },
                                                "type": "object"
                                            },
                                            "description": "The set conversation universe event based model"
                                        },
                                        "type": {
                                            "enum": {
                                                "1": "SetConversationUniverse"
                                            },
                                            "description": "The chat message event type",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "The eventBased chat message"
                            },
                            "content": {
                                "description": "The chat mesage itself",
                                "type": "string"
                            },
                            "messageType": {
                                "enum": {
                                    "1": "PlainText",
                                    "2": "Link",
                                    "3": "EventBased"
                                },
                                "description": "Type of the chat message",
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
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


## /v2/get-unread-conversations
```json
{
    "Method": "GET",
    "Description": "Gets a list of unread conversations",
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
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "participants": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "name": {
                                                "description": "Name of the chat participant",
                                                "type": "string"
                                            },
                                            "type": {
                                                "enum": {
                                                    "1": "User",
                                                    "2": "System"
                                                },
                                                "description": "Type of a chat participant",
                                                "type": "string"
                                            },
                                            "targetId": {
                                                "format": "int64",
                                                "description": "Id of the chat participant",
                                                "type": "integer"
                                            },
                                            "displayName": {
                                                "description": "display name of the chat participant",
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "description": "Participants involved in the conversation"
                            },
                            "initiator": {
                                "$ref": {
                                    "properties": {
                                        "name": {
                                            "description": "Name of the chat participant",
                                            "type": "string"
                                        },
                                        "type": {
                                            "enum": {
                                                "1": "User",
                                                "2": "System"
                                            },
                                            "description": "Type of a chat participant",
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "format": "int64",
                                            "description": "Id of the chat participant",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "display name of the chat participant",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "Conversation initiator entity"
                            },
                            "id": {
                                "format": "int64",
                                "description": "Chat conversation Id",
                                "type": "integer"
                            },
                            "conversationType": {
                                "enum": {
                                    "1": "OneToOneConversation",
                                    "2": "MultiUserConversation",
                                    "3": "CloudEditConversation"
                                },
                                "description": "Type of the conversation",
                                "type": "string"
                            },
                            "title": {
                                "description": "Chat conversation title",
                                "type": "string"
                            },
                            "conversationUniverse": {
                                "$ref": {
                                    "properties": {
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "Id Corresponding to the root place of the universe",
                                            "type": "integer"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "Id corresponding to the universe",
                                            "type": "integer"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "Specifies the universe associated with the conversation"
                            },
                            "lastUpdated": {
                                "format": "date-time",
                                "description": "Specifies the datetime when the conversation was last updated",
                                "type": "string"
                            },
                            "conversationTitle": {
                                "$ref": {
                                    "properties": {
                                        "isDefaultTitle": {
                                            "description": "Specifies if the title displayed for the user is generated as a default title in the backend or was custom assigned by the user.",
                                            "type": "boolean"
                                        },
                                        "titleForViewer": {
                                            "description": "Specifies the title for the conversation specific to the viewer",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "Specifies if the conversation title is generated by default."
                            },
                            "hasUnreadMessages": {
                                "description": "Does the conversation have any unread messages",
                                "type": "boolean"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
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


## /v2/set-conversation-universe
```json
{
    "Method": "POST",
    "Description": "Adds or updates universe associated with a conversation",
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
                    "properties": {
                        "conversationId": {
                            "format": "int64",
                            "description": "Conversation id to add universe to",
                            "type": "integer"
                        },
                        "universeId": {
                            "format": "int64",
                            "description": "ConversationUniverse id to be added to the conversation",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
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


## /v2/send-message
```json
{
    "Method": "POST",
    "Description": "Sends a chat message",
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
                    "properties": {
                        "message": {
                            "description": "The message to be sent.",
                            "type": "string"
                        },
                        "decorators": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "The decorators to attach to the new message."
                        },
                        "conversationId": {
                            "format": "int64",
                            "description": "The conversation Id to send mesage to.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "messageId": {
                            "description": "Id of the chat message being sent",
                            "type": "string"
                        },
                        "filteredForReceivers": {
                            "description": "Was the chat message filtered based on the receivers of the message",
                            "type": "boolean"
                        },
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
                            "type": "string"
                        },
                        "resultType": {
                            "enum": {
                                "1": "Success",
                                "2": "Moderated",
                                "3": "TextTooLong",
                                "4": "NoRealtimeConnection"
                            },
                            "description": "Status of the response",
                            "type": "string"
                        },
                        "sent": {
                            "format": "date-time",
                            "description": "DateTime of when the message was sent",
                            "type": "string"
                        },
                        "content": {
                            "description": "The actual chat message that was being sent",
                            "type": "string"
                        },
                        "messageType": {
                            "enum": {
                                "1": "PlainText",
                                "2": "Link",
                                "3": "EventBased"
                            },
                            "description": "Type of the chat message being sent",
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


## /v2/remove-from-conversation
```json
{
    "Method": "POST",
    "Description": "Removes a user from an existing conversation",
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
                    "properties": {
                        "conversationId": {
                            "format": "int64",
                            "description": "The conversation id.",
                            "type": "integer"
                        },
                        "participantUserId": {
                            "format": "int64",
                            "description": "Participant user id to be removed from the conversation.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
                            "type": "string"
                        },
                        "resultType": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Status of the response",
                            "type": "string"
                        },
                        "conversationId": {
                            "format": "int64",
                            "description": "Id of the conversation to remove a user from",
                            "type": "integer"
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


## /v2/get-user-conversations
```json
{
    "Method": "GET",
    "Description": "Gets all conversations associated with the logged-in User",
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
            "required": true,
            "description": ""
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "participants": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "name": {
                                                "description": "Name of the chat participant",
                                                "type": "string"
                                            },
                                            "type": {
                                                "enum": {
                                                    "1": "User",
                                                    "2": "System"
                                                },
                                                "description": "Type of a chat participant",
                                                "type": "string"
                                            },
                                            "targetId": {
                                                "format": "int64",
                                                "description": "Id of the chat participant",
                                                "type": "integer"
                                            },
                                            "displayName": {
                                                "description": "display name of the chat participant",
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "description": "Participants involved in the conversation"
                            },
                            "initiator": {
                                "$ref": {
                                    "properties": {
                                        "name": {
                                            "description": "Name of the chat participant",
                                            "type": "string"
                                        },
                                        "type": {
                                            "enum": {
                                                "1": "User",
                                                "2": "System"
                                            },
                                            "description": "Type of a chat participant",
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "format": "int64",
                                            "description": "Id of the chat participant",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "display name of the chat participant",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "Conversation initiator entity"
                            },
                            "id": {
                                "format": "int64",
                                "description": "Chat conversation Id",
                                "type": "integer"
                            },
                            "conversationType": {
                                "enum": {
                                    "1": "OneToOneConversation",
                                    "2": "MultiUserConversation",
                                    "3": "CloudEditConversation"
                                },
                                "description": "Type of the conversation",
                                "type": "string"
                            },
                            "title": {
                                "description": "Chat conversation title",
                                "type": "string"
                            },
                            "conversationUniverse": {
                                "$ref": {
                                    "properties": {
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "Id Corresponding to the root place of the universe",
                                            "type": "integer"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "Id corresponding to the universe",
                                            "type": "integer"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "Specifies the universe associated with the conversation"
                            },
                            "lastUpdated": {
                                "format": "date-time",
                                "description": "Specifies the datetime when the conversation was last updated",
                                "type": "string"
                            },
                            "conversationTitle": {
                                "$ref": {
                                    "properties": {
                                        "isDefaultTitle": {
                                            "description": "Specifies if the title displayed for the user is generated as a default title in the backend or was custom assigned by the user.",
                                            "type": "boolean"
                                        },
                                        "titleForViewer": {
                                            "description": "Specifies the title for the conversation specific to the viewer",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "Specifies if the conversation title is generated by default."
                            },
                            "hasUnreadMessages": {
                                "description": "Does the conversation have any unread messages",
                                "type": "boolean"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
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


## /v2/start-cloud-edit-conversation
```json
{
    "Method": "POST",
    "Description": "Creates a new cloud edit conversation",
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
                    "properties": {
                        "placeId": {
                            "format": "int64",
                            "description": "Place id to create a Cloud edit conversation.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
                            "type": "string"
                        },
                        "rejectedParticipants": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "type": {
                                            "enum": {
                                                "1": "User",
                                                "2": "System"
                                            },
                                            "description": "Type of a chat participant",
                                            "type": "string"
                                        },
                                        "rejectedReason": {
                                            "description": "Reason as to why the chat participant was rejected to be a part of the conversation",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Name of the chat participant",
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "format": "int64",
                                            "description": "Id of the chat participant",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "display name of the chat participant",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "List of chat participants who were rejected to be part of the associated conversation"
                        },
                        "resultType": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Status of the response",
                            "type": "string"
                        },
                        "conversation": {
                            "$ref": {
                                "properties": {
                                    "participants": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "name": {
                                                        "description": "Name of the chat participant",
                                                        "type": "string"
                                                    },
                                                    "type": {
                                                        "enum": {
                                                            "1": "User",
                                                            "2": "System"
                                                        },
                                                        "description": "Type of a chat participant",
                                                        "type": "string"
                                                    },
                                                    "targetId": {
                                                        "format": "int64",
                                                        "description": "Id of the chat participant",
                                                        "type": "integer"
                                                    },
                                                    "displayName": {
                                                        "description": "display name of the chat participant",
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array",
                                        "description": "Participants involved in the conversation"
                                    },
                                    "initiator": {
                                        "$ref": {
                                            "properties": {
                                                "name": {
                                                    "description": "Name of the chat participant",
                                                    "type": "string"
                                                },
                                                "type": {
                                                    "enum": {
                                                        "1": "User",
                                                        "2": "System"
                                                    },
                                                    "description": "Type of a chat participant",
                                                    "type": "string"
                                                },
                                                "targetId": {
                                                    "format": "int64",
                                                    "description": "Id of the chat participant",
                                                    "type": "integer"
                                                },
                                                "displayName": {
                                                    "description": "display name of the chat participant",
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Conversation initiator entity"
                                    },
                                    "id": {
                                        "format": "int64",
                                        "description": "Chat conversation Id",
                                        "type": "integer"
                                    },
                                    "conversationType": {
                                        "enum": {
                                            "1": "OneToOneConversation",
                                            "2": "MultiUserConversation",
                                            "3": "CloudEditConversation"
                                        },
                                        "description": "Type of the conversation",
                                        "type": "string"
                                    },
                                    "title": {
                                        "description": "Chat conversation title",
                                        "type": "string"
                                    },
                                    "conversationUniverse": {
                                        "$ref": {
                                            "properties": {
                                                "rootPlaceId": {
                                                    "format": "int64",
                                                    "description": "Id Corresponding to the root place of the universe",
                                                    "type": "integer"
                                                },
                                                "universeId": {
                                                    "format": "int64",
                                                    "description": "Id corresponding to the universe",
                                                    "type": "integer"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Specifies the universe associated with the conversation"
                                    },
                                    "lastUpdated": {
                                        "format": "date-time",
                                        "description": "Specifies the datetime when the conversation was last updated",
                                        "type": "string"
                                    },
                                    "conversationTitle": {
                                        "$ref": {
                                            "properties": {
                                                "isDefaultTitle": {
                                                    "description": "Specifies if the title displayed for the user is generated as a default title in the backend or was custom assigned by the user.",
                                                    "type": "boolean"
                                                },
                                                "titleForViewer": {
                                                    "description": "Specifies the title for the conversation specific to the viewer",
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "description": "Specifies if the conversation title is generated by default."
                                    },
                                    "hasUnreadMessages": {
                                        "description": "Does the conversation have any unread messages",
                                        "type": "boolean"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The newly created conversation"
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


## /v2/mark-as-read
```json
{
    "Method": "POST",
    "Description": "Mark the specified conversation messages as read",
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
                    "properties": {
                        "endMessageId": {
                            "description": "The end message id string.",
                            "type": "string"
                        },
                        "conversationId": {
                            "format": "int64",
                            "description": "the conversation id to be marked as read.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "resultType": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Status of the response",
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


## /v2/rename-group-conversation
```json
{
    "Method": "POST",
    "Description": "Renames the title of an existing conversation",
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
                    "properties": {
                        "newTitle": {
                            "description": "New title for the conversation.",
                            "type": "string"
                        },
                        "conversationId": {
                            "format": "int64",
                            "description": "The conversation id to rename the conversation.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
                            "type": "string"
                        },
                        "title": {
                            "$ref": {
                                "properties": {
                                    "isDefaultTitle": {
                                        "description": "Specifies if the title displayed for the user is generated as a default title in the backend or was custom assigned by the user.",
                                        "type": "boolean"
                                    },
                                    "titleForViewer": {
                                        "description": "Specifies the title for the conversation specific to the viewer",
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "description": "The title object after rename"
                        },
                        "conversationTitle": {
                            "description": "New conversation title after rename",
                            "type": "string"
                        },
                        "resultType": {
                            "enum": {
                                "1": "Success",
                                "2": "Moderated",
                                "3": "TextTooLong"
                            },
                            "description": "Status of the response",
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


## /v2/get-conversations
```json
{
    "Method": "GET",
    "Description": "Gets conversations for the conversationIds specified in the parameters",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "Ids of the conversations to be returned",
            "name": "conversationIds"
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "participants": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "name": {
                                                "description": "Name of the chat participant",
                                                "type": "string"
                                            },
                                            "type": {
                                                "enum": {
                                                    "1": "User",
                                                    "2": "System"
                                                },
                                                "description": "Type of a chat participant",
                                                "type": "string"
                                            },
                                            "targetId": {
                                                "format": "int64",
                                                "description": "Id of the chat participant",
                                                "type": "integer"
                                            },
                                            "displayName": {
                                                "description": "display name of the chat participant",
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "description": "Participants involved in the conversation"
                            },
                            "initiator": {
                                "$ref": {
                                    "properties": {
                                        "name": {
                                            "description": "Name of the chat participant",
                                            "type": "string"
                                        },
                                        "type": {
                                            "enum": {
                                                "1": "User",
                                                "2": "System"
                                            },
                                            "description": "Type of a chat participant",
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "format": "int64",
                                            "description": "Id of the chat participant",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "display name of the chat participant",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "Conversation initiator entity"
                            },
                            "id": {
                                "format": "int64",
                                "description": "Chat conversation Id",
                                "type": "integer"
                            },
                            "conversationType": {
                                "enum": {
                                    "1": "OneToOneConversation",
                                    "2": "MultiUserConversation",
                                    "3": "CloudEditConversation"
                                },
                                "description": "Type of the conversation",
                                "type": "string"
                            },
                            "title": {
                                "description": "Chat conversation title",
                                "type": "string"
                            },
                            "conversationUniverse": {
                                "$ref": {
                                    "properties": {
                                        "rootPlaceId": {
                                            "format": "int64",
                                            "description": "Id Corresponding to the root place of the universe",
                                            "type": "integer"
                                        },
                                        "universeId": {
                                            "format": "int64",
                                            "description": "Id corresponding to the universe",
                                            "type": "integer"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "Specifies the universe associated with the conversation"
                            },
                            "lastUpdated": {
                                "format": "date-time",
                                "description": "Specifies the datetime when the conversation was last updated",
                                "type": "string"
                            },
                            "conversationTitle": {
                                "$ref": {
                                    "properties": {
                                        "isDefaultTitle": {
                                            "description": "Specifies if the title displayed for the user is generated as a default title in the backend or was custom assigned by the user.",
                                            "type": "boolean"
                                        },
                                        "titleForViewer": {
                                            "description": "Specifies the title for the conversation specific to the viewer",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "description": "Specifies if the conversation title is generated by default."
                            },
                            "hasUnreadMessages": {
                                "description": "Does the conversation have any unread messages",
                                "type": "boolean"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
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


## /v2/add-to-conversation
```json
{
    "Method": "POST",
    "Description": "Adds users to an existing conversation",
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
                    "properties": {
                        "participantUserIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "Array of user ids to be added to the conversation."
                        },
                        "conversationId": {
                            "format": "int64",
                            "description": "The conversation id",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "statusMessage": {
                            "description": "Status message to be sent to the requestor",
                            "type": "string"
                        },
                        "rejectedParticipants": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "type": {
                                            "enum": {
                                                "1": "User",
                                                "2": "System"
                                            },
                                            "description": "Type of a chat participant",
                                            "type": "string"
                                        },
                                        "rejectedReason": {
                                            "description": "Reason as to why the chat participant was rejected to be a part of the conversation",
                                            "type": "string"
                                        },
                                        "name": {
                                            "description": "Name of the chat participant",
                                            "type": "string"
                                        },
                                        "targetId": {
                                            "format": "int64",
                                            "description": "Id of the chat participant",
                                            "type": "integer"
                                        },
                                        "displayName": {
                                            "description": "display name of the chat participant",
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "List of rejected chat participants"
                        },
                        "resultType": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Status of the response",
                            "type": "string"
                        },
                        "conversationId": {
                            "format": "int64",
                            "description": "Conversation Id to add a new user to",
                            "type": "integer"
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


# <b>Chat Api v1.0</b>

## /v1.0/party/get-parties-for-conversations
```json
{
    "Method": "GET",
    "Description": ""NONE"",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "array",
            "collectionFormat": "multi",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "name": "conversationIds"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "MemberUsers": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "Id": {
                                                "type": "integer",
                                                "format": "int64"
                                            },
                                            "Name": {
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "readOnly": true
                            },
                            "GamePlaceId": {
                                "format": "int64",
                                "readOnly": true,
                                "type": "integer"
                            },
                            "Id": {
                                "example": "00000000-0000-0000-0000-000000000000",
                                "format": "uuid",
                                "readOnly": true,
                                "type": "string"
                            },
                            "ConversationId": {
                                "format": "int64",
                                "readOnly": true,
                                "type": "integer"
                            },
                            "PartyType": {
                                "enum": {
                                    "1": "PlayTogether",
                                    "2": "General",
                                    "3": "Xbox"
                                },
                                "readOnly": true,
                                "type": "string"
                            },
                            "GameSlotExpiry": {
                                "format": "date-time",
                                "readOnly": true,
                                "type": "string"
                            },
                            "PendingUsers": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "Id": {
                                                "type": "integer",
                                                "format": "int64"
                                            },
                                            "Name": {
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "readOnly": true
                            },
                            "GameName": {
                                "readOnly": true,
                                "type": "string"
                            },
                            "LeaderUser": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "readOnly": true
                            },
                            "GameId": {
                                "example": "00000000-0000-0000-0000-000000000000",
                                "format": "uuid",
                                "readOnly": true,
                                "type": "string"
                            },
                            "CreatorUser": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "readOnly": true
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
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


## /v1.0/party/leave
```json
{
    "Method": "POST",
    "Description": ""NONE"",
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
                        "partyId": {
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
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "MemberUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "GamePlaceId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "Id": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "ConversationId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "PartyType": {
                            "enum": {
                                "1": "PlayTogether",
                                "2": "General",
                                "3": "Xbox"
                            },
                            "readOnly": true,
                            "type": "string"
                        },
                        "GameSlotExpiry": {
                            "format": "date-time",
                            "readOnly": true,
                            "type": "string"
                        },
                        "PendingUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "GameName": {
                            "readOnly": true,
                            "type": "string"
                        },
                        "LeaderUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
                        },
                        "GameId": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "CreatorUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
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


## /v1.0/party/create
```json
{
    "Method": "POST",
    "Description": ""NONE"",
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
                        "invitedUserIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array"
                        },
                        "conversationId": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "MemberUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "GamePlaceId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "Id": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "ConversationId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "PartyType": {
                            "enum": {
                                "1": "PlayTogether",
                                "2": "General",
                                "3": "Xbox"
                            },
                            "readOnly": true,
                            "type": "string"
                        },
                        "GameSlotExpiry": {
                            "format": "date-time",
                            "readOnly": true,
                            "type": "string"
                        },
                        "PendingUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "GameName": {
                            "readOnly": true,
                            "type": "string"
                        },
                        "LeaderUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
                        },
                        "GameId": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "CreatorUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
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


## /v1.0/party/join
```json
{
    "Method": "POST",
    "Description": ""NONE"",
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
                        "partyId": {
                            "type": "string"
                        },
                        "autoFollowPartyLeader": {
                            "type": "boolean"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "Success": {
                            "type": "boolean"
                        },
                        "StatusMessage": {
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


## /v1.0/party/get-invites
```json
{
    "Method": "GET",
    "Description": ""NONE"",
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
            "required": true
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "pageSize",
            "format": "int32",
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "MemberUsers": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "Id": {
                                                "type": "integer",
                                                "format": "int64"
                                            },
                                            "Name": {
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "readOnly": true
                            },
                            "GamePlaceId": {
                                "format": "int64",
                                "readOnly": true,
                                "type": "integer"
                            },
                            "Id": {
                                "example": "00000000-0000-0000-0000-000000000000",
                                "format": "uuid",
                                "readOnly": true,
                                "type": "string"
                            },
                            "ConversationId": {
                                "format": "int64",
                                "readOnly": true,
                                "type": "integer"
                            },
                            "PartyType": {
                                "enum": {
                                    "1": "PlayTogether",
                                    "2": "General",
                                    "3": "Xbox"
                                },
                                "readOnly": true,
                                "type": "string"
                            },
                            "GameSlotExpiry": {
                                "format": "date-time",
                                "readOnly": true,
                                "type": "string"
                            },
                            "PendingUsers": {
                                "items": {
                                    "$ref": {
                                        "properties": {
                                            "Id": {
                                                "type": "integer",
                                                "format": "int64"
                                            },
                                            "Name": {
                                                "type": "string"
                                            }
                                        },
                                        "type": "object"
                                    }
                                },
                                "type": "array",
                                "readOnly": true
                            },
                            "GameName": {
                                "readOnly": true,
                                "type": "string"
                            },
                            "LeaderUser": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "readOnly": true
                            },
                            "GameId": {
                                "example": "00000000-0000-0000-0000-000000000000",
                                "format": "uuid",
                                "readOnly": true,
                                "type": "string"
                            },
                            "CreatorUser": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                },
                                "readOnly": true
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
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


## /v1.0/party/invite
```json
{
    "Method": "POST",
    "Description": ""NONE"",
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
                        "invitedUserId": {
                            "type": "integer",
                            "format": "int64"
                        },
                        "partyId": {
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
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "MemberUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "GamePlaceId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "Id": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "ConversationId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "PartyType": {
                            "enum": {
                                "1": "PlayTogether",
                                "2": "General",
                                "3": "Xbox"
                            },
                            "readOnly": true,
                            "type": "string"
                        },
                        "GameSlotExpiry": {
                            "format": "date-time",
                            "readOnly": true,
                            "type": "string"
                        },
                        "PendingUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "GameName": {
                            "readOnly": true,
                            "type": "string"
                        },
                        "LeaderUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
                        },
                        "GameId": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "CreatorUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
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


## /v1.0/party/remove-from-party
```json
{
    "Method": "POST",
    "Description": ""NONE"",
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
                        "partyId": {
                            "type": "string"
                        },
                        "userId": {
                            "type": "integer",
                            "format": "int64"
                        }
                    },
                    "type": "object"
                }
            },
            "name": "request"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "MemberUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "GamePlaceId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "Id": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "ConversationId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "PartyType": {
                            "enum": {
                                "1": "PlayTogether",
                                "2": "General",
                                "3": "Xbox"
                            },
                            "readOnly": true,
                            "type": "string"
                        },
                        "GameSlotExpiry": {
                            "format": "date-time",
                            "readOnly": true,
                            "type": "string"
                        },
                        "PendingUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "GameName": {
                            "readOnly": true,
                            "type": "string"
                        },
                        "LeaderUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
                        },
                        "GameId": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "CreatorUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
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


## /v1.0/party/get-current
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
                    "properties": {
                        "MemberUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
                        },
                        "GamePlaceId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "Id": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "ConversationId": {
                            "format": "int64",
                            "readOnly": true,
                            "type": "integer"
                        },
                        "GameSlotExpiry": {
                            "format": "date-time",
                            "readOnly": true,
                            "type": "string"
                        },
                        "Party": {
                            "$ref": {
                                "properties": {
                                    "MemberUsers": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "Name": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array",
                                        "readOnly": true
                                    },
                                    "GamePlaceId": {
                                        "format": "int64",
                                        "readOnly": true,
                                        "type": "integer"
                                    },
                                    "Id": {
                                        "example": "00000000-0000-0000-0000-000000000000",
                                        "format": "uuid",
                                        "readOnly": true,
                                        "type": "string"
                                    },
                                    "ConversationId": {
                                        "format": "int64",
                                        "readOnly": true,
                                        "type": "integer"
                                    },
                                    "PartyType": {
                                        "enum": {
                                            "1": "PlayTogether",
                                            "2": "General",
                                            "3": "Xbox"
                                        },
                                        "readOnly": true,
                                        "type": "string"
                                    },
                                    "GameSlotExpiry": {
                                        "format": "date-time",
                                        "readOnly": true,
                                        "type": "string"
                                    },
                                    "PendingUsers": {
                                        "items": {
                                            "$ref": {
                                                "properties": {
                                                    "Id": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "Name": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "array",
                                        "readOnly": true
                                    },
                                    "GameName": {
                                        "readOnly": true,
                                        "type": "string"
                                    },
                                    "LeaderUser": {
                                        "$ref": {
                                            "properties": {
                                                "Id": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "Name": {
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "readOnly": true
                                    },
                                    "GameId": {
                                        "example": "00000000-0000-0000-0000-000000000000",
                                        "format": "uuid",
                                        "readOnly": true,
                                        "type": "string"
                                    },
                                    "CreatorUser": {
                                        "$ref": {
                                            "properties": {
                                                "Id": {
                                                    "type": "integer",
                                                    "format": "int64"
                                                },
                                                "Name": {
                                                    "type": "string"
                                                }
                                            },
                                            "type": "object"
                                        },
                                        "readOnly": true
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "GameName": {
                            "readOnly": true,
                            "type": "string"
                        },
                        "PartyingOnDeviceType": {
                            "type": "string"
                        },
                        "CreatorUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
                        },
                        "LeaderUser": {
                            "$ref": {
                                "properties": {
                                    "Id": {
                                        "type": "integer",
                                        "format": "int64"
                                    },
                                    "Name": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "readOnly": true
                        },
                        "GameId": {
                            "example": "00000000-0000-0000-0000-000000000000",
                            "format": "uuid",
                            "readOnly": true,
                            "type": "string"
                        },
                        "PendingUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "Id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "Name": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "readOnly": true
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


## /v1.0/party/update-user-device
```json
{
    "Method": "POST",
    "Description": ""NONE"",
    "Consumes": "NONE",
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
                        "Success": {
                            "type": "boolean"
                        },
                        "StatusMessage": {
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


## /v1.0/party/take-leadership
```json
{
    "Method": "POST",
    "Description": ""NONE"",
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
                        "partyId": {
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
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "Success": {
                            "type": "boolean"
                        },
                        "StatusMessage": {
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


