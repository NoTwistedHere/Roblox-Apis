# <b>Friends Api v1</b>

## /v1/users/{targetUserId}/request-friendship
```json
{
    "Method": "POST",
    "Description": "Send a friend request to target user",
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
            "name": "targetUserId",
            "format": "int64",
            "required": true,
            "description": "The target user Id for friend request"
        },
        "2": {
            "in": "body",
            "name": "friendshipRequestModel",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "friendshipOriginSourceType": {
                            "enum": {
                                "1": "Unknown",
                                "2": "PlayerSearch",
                                "3": "InGame",
                                "4": "UserProfile"
                            },
                            "description": "Which source the friend request originated from",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The source which the friend request originated from"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user is banned from performing operation.\r\n3: The user is blocked from performing this action.\r\n14: The user has not passed the captcha."
        },
        "400": {
            "description": "1: The target user is invalid or does not exist.\r\n5: The target user is already a friend.\r\n6: Invalid parameters.\r\n7: The user cannot be friends with itself.\r\n10: The friend request does not exist.\r\n13: The users are not in the same game.\r\n31: User with max friends sent friend request."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This is response model to notify when action succeeded, failed, or captcha is required",
                    "properties": {
                        "isCaptchaRequired": {
                            "description": "Captcha is set to true if captcha is required from user to perform action",
                            "type": "boolean"
                        },
                        "success": {
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "9: The flood limit has been exceeded."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/{targetUserId}/follow
```json
{
    "Method": "POST",
    "Description": "Creates the following between a user and user with targetUserId",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "targetUserId",
            "format": "int64",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user is banned from performing operation.\r\n3: The user is blocked from performing this action.\r\n14: The user has not passed the captcha."
        },
        "400": {
            "description": "1: The target user is invalid or does not exist.\r\n6: Invalid parameters.\r\n8: The user cannot follow itself."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This is response model to notify when action succeeded, failed, or captcha is required",
                    "properties": {
                        "isCaptchaRequired": {
                            "description": "Captcha is set to true if captcha is required from user to perform action",
                            "type": "boolean"
                        },
                        "success": {
                            "type": "boolean"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "9: The flood limit has been exceeded."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/{userId}/friends/count
```json
{
    "Method": "GET",
    "Description": "Get the number of friends a user has",
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
            "required": true
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for Friends Count",
                    "properties": {
                        "count": {
                            "format": "int32",
                            "description": "Count of friends",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The target user is invalid or does not exist."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/metadata
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
            "name": "targetUserId",
            "format": "int64",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "userName": {
                            "type": "string"
                        },
                        "isFriendsUserDataStoreCacheEnabled": {
                            "readOnly": true,
                            "type": "boolean"
                        },
                        "isFriendsFilterExperimentEnabled": {
                            "readOnly": true,
                            "type": "boolean"
                        },
                        "isNearbyUpsellEnabled": {
                            "type": "boolean"
                        },
                        "displayName": {
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        }
    },
    "Internal": false
}
```
<hr>


## /v1/my/friends/count
```json
{
    "Method": "GET",
    "Description": "Get the number of friends a user has",
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
                    "description": "Response model for Friends Count",
                    "properties": {
                        "count": {
                            "format": "int32",
                            "description": "Count of friends",
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


## /v1/users/{requesterUserId}/accept-friend-request
```json
{
    "Method": "POST",
    "Description": "Accept a friend request.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "requesterUserId",
            "format": "int64",
            "required": true,
            "description": "The user Id of the requester"
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
            "description": "0: Token Validation Failed\r\n3: The user is blocked from performing this action."
        },
        "400": {
            "description": "1: The target user is invalid or does not exist.\r\n10: The friend request does not exist.\r\n11: The current users friends limit has been exceeded.\r\n12: The target users friends limit has been exceeded."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/user/friend-requests/decline-all
```json
{
    "Method": "POST",
    "Description": "Decline all pending friend requests for the authenticated user.",
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


## /v1/users/{userId}/friends/online
```json
{
    "Method": "GET",
    "Description": "Get list of all online friends for the specified user.",
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
            "description": "The user Id to get the friends for."
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
                                    "description": "A response model representing user presence information.",
                                    "properties": {
                                        "id": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userPresence": {
                                            "$ref": {
                                                "type": "object",
                                                "description": "Response model for {Roblox.Web.Presence.Interfaces.IUserPresence} objects",
                                                "properties": {
                                                    "UserPresenceType": {
                                                        "description": "User Presence Type",
                                                        "type": "string"
                                                    },
                                                    "universeId": {
                                                        "type": "integer",
                                                        "format": "int64"
                                                    },
                                                    "UserLocationType": {
                                                        "description": "Location Type",
                                                        "type": "string"
                                                    },
                                                    "lastOnline": {
                                                        "format": "date-time",
                                                        "description": "Most recent time online",
                                                        "type": "string"
                                                    },
                                                    "gameInstanceId": {
                                                        "type": "string",
                                                        "format": "uuid",
                                                        "description": "Game Instance Id",
                                                        "example": "00000000-0000-0000-0000-000000000000"
                                                    },
                                                    "rootPlaceId": {
                                                        "format": "int64",
                                                        "description": "Root Place Id",
                                                        "type": "integer"
                                                    },
                                                    "lastLocation": {
                                                        "description": "Last Location",
                                                        "type": "string"
                                                    },
                                                    "placeId": {
                                                        "format": "int64",
                                                        "description": "Place Id",
                                                        "type": "integer"
                                                    }
                                                }
                                            },
                                            "description": "{Roblox.Web.Presence.Interfaces.IUserPresence} Object"
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
            "description": "1: The target user is invalid or does not exist.\r\n6: Invalid parameters."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/friends/verified/nearby/health
```json
{
    "Method": "GET",
    "Description": "Checks if session is still alive",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "400": {
            "description": "5: Bad Argument"
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
            "description": "2: The code does not exist"
        },
        "429": {
            "description": "3: There were too many requests to an endpoint"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/{targetUserId}/unfollow
```json
{
    "Method": "POST",
    "Description": "Deletes the following between a user and user with targetUserId",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "targetUserId",
            "format": "int64",
            "required": true,
            "description": ""
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n2: The user is banned from performing operation.\r\n3: The user is blocked from performing this action.\r\n14: The user has not passed the captcha."
        },
        "400": {
            "description": "1: The target user is invalid or does not exist.\r\n6: Invalid parameters.\r\n8: The user cannot follow itself."
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
            "description": "9: The flood limit has been exceeded."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/{targetUserId}/followings
```json
{
    "Method": "GET",
    "Description": "Get all users that user with targetUserId is following in page response format",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "targetUserId",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "2": {
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
                                    "description": "A response model representing user information that also contains select presence information",
                                    "properties": {
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "isDeleted": {
                                            "description": "Whether the user is deleted.",
                                            "type": "boolean"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "isOnline": {
                                            "description": "Whether the user is online.",
                                            "type": "boolean"
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
        "403": {
            "description": "2: The user is banned from performing operation.\r\n3: The user is blocked from performing this action."
        },
        "400": {
            "description": "1: The target user is invalid or does not exist.\r\n6: Invalid parameters."
        },
        "429": {
            "description": "9: The flood limit has been exceeded."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/friends/verified/qr/session
```json
{
    "Method": "POST",
    "Description": "Get or Create a session for authenticated user",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: The code does not exist"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This is response model for representing a QR session",
                    "properties": {
                        "expires": {
                            "format": "int64",
                            "description": "Expire time in unix timestamp",
                            "type": "integer"
                        },
                        "code": {
                            "description": "Code for session",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: There were too many requests to an endpoint"
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Removes session for authenticated user",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "5: Bad Argument"
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
            "description": "3: There were too many requests to an endpoint"
        },
        "404": {
            "description": "2: The code does not exist"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/{targetUserId}/followers
```json
{
    "Method": "GET",
    "Description": "Get all users that follow user with targetUserId in page response format",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "targetUserId",
            "format": "int64",
            "required": true,
            "description": ""
        },
        "2": {
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
                                    "description": "A response model representing user information that also contains select presence information",
                                    "properties": {
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "isDeleted": {
                                            "description": "Whether the user is deleted.",
                                            "type": "boolean"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "isOnline": {
                                            "description": "Whether the user is online.",
                                            "type": "boolean"
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
        "403": {
            "description": "2: The user is banned from performing operation.\r\n3: The user is blocked from performing this action."
        },
        "400": {
            "description": "1: The target user is invalid or does not exist.\r\n6: Invalid parameters."
        },
        "429": {
            "description": "9: The flood limit has been exceeded."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/{userId}/friends/statuses
```json
{
    "Method": "GET",
    "Description": "Gets a list of friend statuses of specified users against the specified user.",
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
            "description": "The user to check the friend statuses against."
        },
        "2": {
            "in": "query",
            "type": "array",
            "collectionFormat": "csv",
            "items": {
                "format": "int64",
                "type": "integer"
            },
            "required": true,
            "description": "",
            "name": "userIds"
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
                                    "description": "The friendship status response model.",
                                    "properties": {
                                        "id": {
                                            "format": "int64",
                                            "description": "The user Id of the friend.",
                                            "type": "integer"
                                        },
                                        "status": {
                                            "enum": {
                                                "1": "NotFriends",
                                                "2": "Friends",
                                                "3": "RequestSent",
                                                "4": "RequestReceived"
                                            },
                                            "description": "The friendship status.",
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
            "description": "1: The target user is invalid or does not exist.\r\n15: Too many ids.\r\n16: Invalid ids."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/user/following-exists
```json
{
    "Method": "POST",
    "Description": "Returns whether or not the current user is following each userId in a list of userIds",
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
                    "description": "Request model for FollowingExists endpoint",
                    "properties": {
                        "targetUserIds": {
                            "items": {
                                "type": "integer",
                                "format": "int64"
                            },
                            "type": "array",
                            "description": "The userIds which the user may or may not be following."
                        }
                    }
                }
            },
            "description": "The userIds potentially being followed"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "0: An invalid userId was passed in."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response model for FollowingExists endpoint.",
                    "properties": {
                        "followings": {
                            "items": {
                                "$ref": {
                                    "type": "object",
                                    "description": "Response contained in list for FollowingExists endpoint. Corresponds to a single userId.",
                                    "properties": {
                                        "isFollowing": {
                                            "description": "Whether or not a user is following userId in FriendsController.FollowingExists",
                                            "type": "boolean"
                                        },
                                        "userId": {
                                            "format": "int64",
                                            "description": "The userId being potentially followed",
                                            "type": "integer"
                                        }
                                    }
                                }
                            },
                            "type": "array",
                            "description": "A list of userIds and whether or not the given user is following them."
                        }
                    }
                }
            }
        },
        "503": {
            "description": "1: Followers are disabled at this time."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/friends/verified/nearby/{code}/redeem
```json
{
    "Method": "POST",
    "Description": "Redeems nearby code",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "code",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "5: Bad Argument\r\n6: Maximum Redemption reached\r\n7: Other user's friend limit exceeded.\r\n8: Current user's friend limit exceeded.\r\n9: Friendship already exists.\r\n10: Friend request does not exist to be accepted."
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
            "description": "3: There were too many requests to an endpoint"
        },
        "404": {
            "description": "2: The code does not exist"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/friends/verified/qr/{code}/redeem
```json
{
    "Method": "POST",
    "Description": "Redeems QR code",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "code",
            "required": true
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "5: Bad Argument\r\n6: Maximum Redemption reached"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This is response model for representing the data from QR redeem request",
                    "properties": {
                        "userId": {
                            "format": "int64",
                            "description": "user id associated with the code",
                            "type": "integer"
                        },
                        "username": {
                            "description": "Username of the user with the above user id",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: There were too many requests to an endpoint"
        },
        "404": {
            "description": "2: The code does not exist"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/recommended-users
```json
{
    "Method": "GET",
    "Description": "Return a list of Recommendations for the Authenticated User.
V1 API to just return list of existing friends for the Authenticated user.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "Successfully returns list of recommendations.",
            "schema": {
                "$ref": {
                    "properties": {
                        "recommendedUsers": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "userPresenceType": {
                                            "type": "string",
                                            "enum": {
                                                "1": "Offline",
                                                "2": "Online",
                                                "3": "InGame",
                                                "4": "InStudio"
                                            }
                                        },
                                        "userProfilePageUrl": {
                                            "type": "string"
                                        },
                                        "userId": {
                                            "type": "integer",
                                            "format": "int64"
                                        },
                                        "userName": {
                                            "type": "string"
                                        }
                                    },
                                    "type": "object"
                                }
                            },
                            "type": "array",
                            "description": "A collection of User Recommendations for a user."
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


## /v1/users/{requesterUserId}/decline-friend-request
```json
{
    "Method": "POST",
    "Description": "Decline a friend request.",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "requesterUserId",
            "format": "int64",
            "required": true,
            "description": "The user Id of the requester"
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
        },
        "400": {
            "description": "1: The target user is invalid or does not exist.\r\n10: The friend request does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/friends/verified/nearby/code/{code}
```json
{
    "Method": "GET",
    "Description": "Gets data from a nearby code",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "code",
            "required": true
        }
    },
    "Responses": {
        "400": {
            "description": "4: Cannot get own data\r\n5: Bad Argument"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This is response model for representing the data from nearby get friends data request",
                    "properties": {
                        "username": {
                            "description": "Username of the user with the above user id",
                            "type": "string"
                        },
                        "userId": {
                            "format": "int64",
                            "description": "user id associated with the code",
                            "type": "integer"
                        },
                        "friendshipStatus": {
                            "enum": {
                                "1": "NoFriendship",
                                "2": "PendingOnOtherUser",
                                "3": "PendingOnCurrentUser",
                                "4": "Friends"
                            },
                            "description": "Friendship status",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "404": {
            "description": "2: The code does not exist"
        },
        "429": {
            "description": "3: There were too many requests to an endpoint"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/friends/verified/nearby/session
```json
{
    "Method": "POST",
    "Description": "Get or Create a session for authenticated user",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "2: The code does not exist"
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "This is response model for representing a nearby session",
                    "properties": {
                        "expires": {
                            "format": "int64",
                            "description": "Expire time in unix timestamp",
                            "type": "integer"
                        },
                        "code": {
                            "description": "Code for session",
                            "type": "string"
                        }
                    }
                }
            }
        },
        "429": {
            "description": "3: There were too many requests to an endpoint"
        }
    },
    "Internal": false
}
```
<hr>

```json
{
    "Method": "DELETE",
    "Description": "Removes session for authenticated user",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": "NONE",
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed"
        },
        "400": {
            "description": "5: Bad Argument"
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
            "description": "3: There were too many requests to an endpoint"
        },
        "404": {
            "description": "2: The code does not exist"
        }
    },
    "Internal": false
}
```
<hr>


## /v1/my/friends/requests
```json
{
    "Method": "GET",
    "Description": "Get all users that friend requests with targetUserId using exclusive start paging",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "default": "Desc",
            "enum": {
                "1": "Asc",
                "2": "Desc"
            },
            "description": "Sorted by friend request updated time with default descending sort order",
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
        "403": {
            "description": "2: The user is banned from performing operation.\r\n3: The user is blocked from performing this action."
        },
        "400": {
            "description": "1: The target user is invalid or does not exist.\r\n6: Invalid parameters."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
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
                            },
                            "type": "array"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "9: The flood limit has been exceeded."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/{targetUserId}/followings/count
```json
{
    "Method": "GET",
    "Description": "Get the number of following a user has",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "targetUserId",
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
                    "description": "Response model for following or followers Count",
                    "properties": {
                        "count": {
                            "format": "int64",
                            "description": "Count of following or followers",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The target user is invalid or does not exist."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/{userId}/friends
```json
{
    "Method": "GET",
    "Description": "Get list of all friends for the specified user.",
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
            "description": "The user Id to get the friends for."
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
                                    "description": "A response model representing user information that also contains select presence information",
                                    "properties": {
                                        "created": {
                                            "type": "string",
                                            "format": "date-time"
                                        },
                                        "isDeleted": {
                                            "description": "Whether the user is deleted.",
                                            "type": "boolean"
                                        },
                                        "description": {
                                            "type": "string"
                                        },
                                        "isOnline": {
                                            "description": "Whether the user is online.",
                                            "type": "boolean"
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
            "description": "1: The target user is invalid or does not exist."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/users/{targetUserId}/unfriend
```json
{
    "Method": "POST",
    "Description": "Unfriend a user",
    "Consumes": "NONE",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "targetUserId",
            "format": "int64",
            "required": true,
            "description": "The target user id to unfriend"
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
        },
        "400": {
            "description": "1: The target user is invalid or does not exist."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/user/friend-requests/count
```json
{
    "Method": "GET",
    "Description": "Return the number of pending friend requests.",
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
                    "description": "Response model for Pending Friend Request Count",
                    "properties": {
                        "count": {
                            "format": "int32",
                            "description": "Count of pending friend requests",
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


## /v1/users/{targetUserId}/followers/count
```json
{
    "Method": "GET",
    "Description": "Get the number of following a user has",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "integer",
            "name": "targetUserId",
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
                    "description": "Response model for following or followers Count",
                    "properties": {
                        "count": {
                            "format": "int64",
                            "description": "Count of following or followers",
                            "type": "integer"
                        }
                    }
                }
            }
        },
        "400": {
            "description": "1: The target user is invalid or does not exist."
        }
    },
    "Internal": false
}
```
<hr>


