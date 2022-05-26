# <b>Voice Api v1</b>

## /v1/calls/subscriptions/cancel
```json
{
    "Method": "POST",
    "Description": "Cancel (and close) an user's subscription to a voice feed of another user",
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
                    "description": "Request model for user feed subscription operations",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        },
                        "subscribedUsers": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Request model for a call publisher's details, does not include the publishing state (muted/unmuted)",
                                    "properties": {
                                        "feedReferenceId": {
                                            "format": "int64",
                                            "description": "Gets or sets the unique identifier for a publisher's feed (timestamp user finished publishing handshake)\r\nThis is used to identify the latest feed associated with a publisher",
                                            "type": "integer"
                                        },
                                        "userId": {
                                            "format": "int64",
                                            "description": "Gets or sets the user Id",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets the publisher infos for all users to be subscribed by the subscription request"
                        }
                    }
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
                    "type": "object",
                    "description": "Base Response model for subscription operations",
                    "properties": {
                        "failures": {
                            "type": "object",
                            "additionalProperties": {
                                "type": "string"
                            },
                            "description": "Gets or sets the reason, for each publisher the subscription operation failed"
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
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
    "Internal": true
}
```
<hr>


## /v1/calls/publish/pause
```json
{
    "Method": "POST",
    "Description": "Pause publishing voice in an existing voice call",
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
                    "description": "Request model to start publishing to voice call",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        }
                    }
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
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/groups
```json
{
    "Method": "POST",
    "Description": "Create voice group for internal use",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "{The response model for the CreateGroup endpoint}",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "The response model for the CreateGroup endpoint",
                    "properties": {
                        "channelIdentifier": {
                            "description": "Gets or sets the channel identifier",
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
    "Internal": true
}
```
<hr>


## /v1/calls/subscriptions/start
```json
{
    "Method": "POST",
    "Description": "Initiates an user's subscription to a voice feed of another user",
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
                    "description": "Request model for user feed subscription operations",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        },
                        "subscribedUsers": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Request model for a call publisher's details, does not include the publishing state (muted/unmuted)",
                                    "properties": {
                                        "feedReferenceId": {
                                            "format": "int64",
                                            "description": "Gets or sets the unique identifier for a publisher's feed (timestamp user finished publishing handshake)\r\nThis is used to identify the latest feed associated with a publisher",
                                            "type": "integer"
                                        },
                                        "userId": {
                                            "format": "int64",
                                            "description": "Gets or sets the user Id",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets the publisher infos for all users to be subscribed by the subscription request"
                        }
                    }
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
                    "type": "object",
                    "description": "Base Response model for subscription operations",
                    "properties": {
                        "failures": {
                            "type": "object",
                            "additionalProperties": {
                                "type": "string"
                            },
                            "description": "Gets or sets the reason, for each publisher the subscription operation failed"
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
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
    "Internal": true
}
```
<hr>


## /v1/groups/bulk
```json
{
    "Method": "POST",
    "Description": "Create multiple voice groups for internal use",
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
                    "description": "Request for creating group channels in bulk",
                    "properties": {
                        "groupIds": {
                            "items": {
                                "type": "string"
                            },
                            "type": "array",
                            "description": "Gets or sets the group ids to create."
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "{base response model for voice apis}",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/calls/publish/start
```json
{
    "Method": "POST",
    "Description": "Start publishing voice in an existing voice call",
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
                    "description": "Request model to start publishing to voice call",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "isMuted": {
                            "description": "Gets or sets a value indicating whether to start as muted or not",
                            "type": "boolean"
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        },
                        "offerSdp": {
                            "description": "Gets or sets sdp offer to start publishing",
                            "type": "string"
                        }
                    }
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
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/settings
```json
{
    "Method": "GET",
    "Description": "Returns voice chat settings details for the requesting user.",
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
                    "type": "object",
                    "description": "Response model for voice settings associated with the user",
                    "properties": {
                        "isVoiceEnabled": {
                            "description": "Gets or sets a value indicating whether this user is eligible for voice chat",
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/calls/chat/{conversationId}/join
```json
{
    "Method": "POST",
    "Description": "Join voice call for a chat conversation user is part of",
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
            "name": "conversationId",
            "format": "int64",
            "required": true,
            "description": "chat conversation Id"
        },
        "2": {
            "in": "body",
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Base request class for VoiceController",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        }
                    }
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
                    "type": "object",
                    "description": "response model for try join voice channel request",
                    "properties": {
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
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
    "Internal": true
}
```
<hr>


## /v1/calls/chat/join
```json
{
    "Method": "POST",
    "Description": "Join voice call for a chat conversation user is part of",
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
                    "description": "Request model to join voice call for a chat conversation",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "type": {
                            "description": "Gets or sets the type of joined call",
                            "type": "string"
                        },
                        "callReferenceId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Request model to join voice call for a chat conversation}"
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "response model for try join voice channel request",
                    "properties": {
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
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
    "Internal": true
}
```
<hr>


## /v1/calls/{channelId}/users
```json
{
    "Method": "GET",
    "Description": "Returns a list of the ids for all users active/publishing in a call (except for the user making the request).",
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
            "description": "The unique channel Id of the call"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for users in voice call",
                    "properties": {
                        "publishers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "isMuted": {
                                            "type": "boolean"
                                        },
                                        "feedReferenceId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userId": {
                                            "type": "integer",
                                            "format": "int64"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets the user Id"
                        },
                        "channelId": {
                            "description": "Gets or sets the unique id of the call",
                            "type": "string"
                        },
                        "ownState": {
                            "$ref": {
                                "type": "object",
                                "description": "Wraps a call participant's state",
                                "properties": {
                                    "isMuted": {
                                        "description": "Gets or sets if the user is muted",
                                        "type": "boolean"
                                    }
                                }
                            },
                            "description": "Gets or sets the requesting user's state in the channel"
                        }
                    }
                }
            }
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/calls/subscriptions/complete
```json
{
    "Method": "POST",
    "Description": "Completes an user's subscription to a voice feed of another user",
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
                    "description": "Request model to complete subscribing to user feeds in voice call",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        },
                        "sdpAnswersList": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Request model for a call publisher's details, does not include the publishing state (muted/unmuted)",
                                    "properties": {
                                        "sdp": {
                                            "description": "Gets or sets an sdp message representing either an offer from or an answer to the publisher.",
                                            "type": "string"
                                        },
                                        "publisher": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Request model for a call publisher's details, does not include the publishing state (muted/unmuted)",
                                                "properties": {
                                                    "feedReferenceId": {
                                                        "format": "int64",
                                                        "description": "Gets or sets the unique identifier for a publisher's feed (timestamp user finished publishing handshake)\r\nThis is used to identify the latest feed associated with a publisher",
                                                        "type": "integer"
                                                    },
                                                    "userId": {
                                                        "format": "int64",
                                                        "description": "Gets or sets the user Id",
                                                        "type": "integer"
                                                    }
                                                }
                                            },
                                            "description": "Gets or sets the publisher's info"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets publisher userIds to subscribe to"
                        }
                    }
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
                    "type": "object",
                    "description": "Base Response model for subscription operations",
                    "properties": {
                        "failures": {
                            "type": "object",
                            "additionalProperties": {
                                "type": "string"
                            },
                            "description": "Gets or sets the reason, for each publisher the subscription operation failed"
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
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
    "Internal": true
}
```
<hr>


## /v1/calls/subscriptions/trickle
```json
{
    "Method": "POST",
    "Description": "Trickles ICE candidates for a subscription's peer connection
https://webrtcglossary.com/trickle-ice/",
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
                    "description": "Request model for Trickle",
                    "properties": {
                        "isLast": {
                            "description": "Gets or sets a value indicating whether this is the last candidate.\r\nThis allows combining the last candidate trickle request with signaling trickle end.",
                            "type": "boolean"
                        },
                        "subscribedUser": {
                            "$ref": {
                                "type": "object",
                                "description": "Request model for a call publisher's details, does not include the publishing state (muted/unmuted)",
                                "properties": {
                                    "feedReferenceId": {
                                        "format": "int64",
                                        "description": "Gets or sets the unique identifier for a publisher's feed (timestamp user finished publishing handshake)\r\nThis is used to identify the latest feed associated with a publisher",
                                        "type": "integer"
                                    },
                                    "userId": {
                                        "format": "int64",
                                        "description": "Gets or sets the user Id",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "Gets or sets the publisher info for the user being subscribed to"
                        },
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        },
                        "candidates": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "sdpMid": {
                                            "type": "string"
                                        },
                                        "sdpMLineIndex": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "candidate": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets Web-RTC ICE candidates"
                        }
                    }
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
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/calls/join
```json
{
    "Method": "POST",
    "Description": "Join voice call from either chat conversation or group",
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
                    "description": "Request model to join voice call for a chat conversation",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "type": {
                            "description": "Gets or sets the type of joined call",
                            "type": "string"
                        },
                        "callReferenceId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "{Request model to join voice call for a chat conversation}"
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "response model for try join voice channel request",
                    "properties": {
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
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
    "Internal": true
}
```
<hr>


## /v1/turn/auth
```json
{
    "Method": "GET",
    "Description": "Returns turn server auth details for the requesting user.",
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
                        "username": {
                            "type": "string"
                        },
                        "password": {
                            "type": "string"
                        },
                        "ttl": {
                            "type": "integer",
                            "format": "int32"
                        },
                        "uris": {
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
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": true
}
```
<hr>


## /v1/calls/{channelId}/leave
```json
{
    "Method": "POST",
    "Description": "Leave a named voice channel",
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
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/calls/group/{groupId}/join
```json
{
    "Method": "POST",
    "Description": "Join voice call for an internal group Id",
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
            "name": "groupId",
            "required": true,
            "description": ""
        },
        "2": {
            "in": "body",
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Base request class for VoiceController",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        }
                    }
                }
            },
            "description": "{Base request class for VoiceController}\r\n{Base request class for VoiceController}"
        }
    },
    "Responses": {
        "200": {
            "description": "{response model for try join voice channel request}",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "response model for try join voice channel request",
                    "properties": {
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
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
    "Internal": true
}
```
<hr>


## /v1/calls/publish/trickle/end
```json
{
    "Method": "POST",
    "Description": "Finish the trickle ICE candidate process
https://webrtcglossary.com/trickle-ice/",
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
                    "description": "Request model to start publishing to voice call",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        }
                    }
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
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/calls/leave
```json
{
    "Method": "POST",
    "Description": "Leave voice call for a channel",
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
                    "description": "Request model to start publishing to voice call",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        }
                    }
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
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/calls/publish/resume
```json
{
    "Method": "POST",
    "Description": "Resume publishing voice in an existing voice call",
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
                    "description": "Request model to start publishing to voice call",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        }
                    }
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
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/calls/publish/trickle
```json
{
    "Method": "POST",
    "Description": "Trickles ICE candidates for a call's publishing peer connection
https://webrtcglossary.com/trickle-ice/",
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
                    "description": "Request model for Trickle ICE request for a completing a subscription/peer connection",
                    "properties": {
                        "isLast": {
                            "description": "Gets or sets a value indicating whether this is the last candidate.\r\nThis allows combining the last candidate trickle request with signaling trickle end.",
                            "type": "boolean"
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        },
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "candidates": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "sdpMid": {
                                            "type": "string"
                                        },
                                        "sdpMLineIndex": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "candidate": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets Web-RTC ICE candidates"
                        }
                    }
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
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/calls/subscriptions/pause
```json
{
    "Method": "POST",
    "Description": "Pause an user's subscription to a voice feed of another user",
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
                    "description": "Request model for user feed subscription operations",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        },
                        "subscribedUsers": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Request model for a call publisher's details, does not include the publishing state (muted/unmuted)",
                                    "properties": {
                                        "feedReferenceId": {
                                            "format": "int64",
                                            "description": "Gets or sets the unique identifier for a publisher's feed (timestamp user finished publishing handshake)\r\nThis is used to identify the latest feed associated with a publisher",
                                            "type": "integer"
                                        },
                                        "userId": {
                                            "format": "int64",
                                            "description": "Gets or sets the user Id",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets the publisher infos for all users to be subscribed by the subscription request"
                        }
                    }
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
                    "type": "object",
                    "description": "Base Response model for subscription operations",
                    "properties": {
                        "failures": {
                            "type": "object",
                            "additionalProperties": {
                                "type": "string"
                            },
                            "description": "Gets or sets the reason, for each publisher the subscription operation failed"
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
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
    "Internal": true
}
```
<hr>


## /v1/clientlog
```json
{
    "Method": "POST",
    "Description": "Log a debug message from the client.
THIS IS NOT A LONG TERM SOLUTION AND WILL BE REMOVED BEFORE GOING INTO PRODUCTION!",
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
                    "description": "Holds a client log message to be stored in the server logs",
                    "properties": {
                        "messages": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Wraps a single log message from the client",
                                    "properties": {
                                        "isError": {
                                            "description": "Gets or sets a value indicating whether this is a client-side error level log. All other logs will be treated as info level.",
                                            "type": "boolean"
                                        },
                                        "message": {
                                            "description": "Gets or sets the logs message content.",
                                            "type": "string"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets the logs messages."
                        }
                    }
                }
            },
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "{base response model for voice apis}",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


## /v1/calls/subscriptions/resume
```json
{
    "Method": "POST",
    "Description": "Resume an user's subscription to a voice feed of another user",
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
                    "description": "Request model for user feed subscription operations",
                    "properties": {
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        },
                        "subscribedUsers": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Request model for a call publisher's details, does not include the publishing state (muted/unmuted)",
                                    "properties": {
                                        "feedReferenceId": {
                                            "format": "int64",
                                            "description": "Gets or sets the unique identifier for a publisher's feed (timestamp user finished publishing handshake)\r\nThis is used to identify the latest feed associated with a publisher",
                                            "type": "integer"
                                        },
                                        "userId": {
                                            "format": "int64",
                                            "description": "Gets or sets the user Id",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets the publisher infos for all users to be subscribed by the subscription request"
                        }
                    }
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
                    "type": "object",
                    "description": "Base Response model for subscription operations",
                    "properties": {
                        "failures": {
                            "type": "object",
                            "additionalProperties": {
                                "type": "string"
                            },
                            "description": "Gets or sets the reason, for each publisher the subscription operation failed"
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
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
    "Internal": true
}
```
<hr>


## /v1/calls/subscriptions/trickle/end
```json
{
    "Method": "POST",
    "Description": "Finish the trickle ICE candidate process.
https://webrtcglossary.com/trickle-ice/",
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
                    "description": "Request model for Trickle",
                    "properties": {
                        "isLast": {
                            "description": "Gets or sets a value indicating whether this is the last candidate.\r\nThis allows combining the last candidate trickle request with signaling trickle end.",
                            "type": "boolean"
                        },
                        "subscribedUser": {
                            "$ref": {
                                "type": "object",
                                "description": "Request model for a call publisher's details, does not include the publishing state (muted/unmuted)",
                                "properties": {
                                    "feedReferenceId": {
                                        "format": "int64",
                                        "description": "Gets or sets the unique identifier for a publisher's feed (timestamp user finished publishing handshake)\r\nThis is used to identify the latest feed associated with a publisher",
                                        "type": "integer"
                                    },
                                    "userId": {
                                        "format": "int64",
                                        "description": "Gets or sets the user Id",
                                        "type": "integer"
                                    }
                                }
                            },
                            "description": "Gets or sets the publisher info for the user being subscribed to"
                        },
                        "sessionId": {
                            "minLength": 0,
                            "type": "string",
                            "description": "Gets or sets unique id of the joined call",
                            "maxLength": 65
                        },
                        "channelId": {
                            "description": "Gets or sets unique id of the joined call",
                            "type": "string"
                        },
                        "candidates": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "sdpMid": {
                                            "type": "string"
                                        },
                                        "sdpMLineIndex": {
                                            "type": "integer",
                                            "format": "int32"
                                        },
                                        "candidate": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "Gets or sets Web-RTC ICE candidates"
                        }
                    }
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
                    "type": "object",
                    "description": "base response model for voice apis",
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success"
                            },
                            "description": "Gets or sets status of response",
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
    "Internal": true
}
```
<hr>


# <b>Voice Api v2</b>

## /v2/tokens
```json
{
    "Method": "POST",
    "Description": "Creates a new signed JWT token containing the channel and user details from the request.",
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
            "in": "header",
            "type": "integer",
            "name": "Roblox-Place-Id",
            "format": "int64",
            "description": "",
        },
        "2": {
            "in": "body",
            "name": "requestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request model for the API to create a new channel token",
                    "properties": {
                        "global": {
                            "description": "Gets or sets a value indicating whether this is a global channel",
                            "type": "boolean"
                        },
                        "channelName": {
                            "minLength": 1,
                            "type": "string",
                            "description": "Gets or sets the name of the channel",
                            "maxLength": 32
                        },
                        "userId": {
                            "format": "int64",
                            "description": "Gets or sets the user id for which the token is valid",
                            "type": "integer"
                        },
                        "serverId": {
                            "format": "int64",
                            "description": "Gets or sets the server id for which the token is valid",
                            "type": "integer"
                        }
                    }
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
                    "type": "object",
                    "description": "Response model for serializing a channel token response",
                    "properties": {
                        "token": {
                            "description": "Gets or sets the resulting token",
                            "type": "string"
                        },
                        "expires": {
                            "format": "int64",
                            "description": "Gets or sets the token's expiry time as a Unix timestamp",
                            "type": "integer"
                        }
                    }
                }
            }
        }
    },
    "Internal": true
}
```
<hr>


