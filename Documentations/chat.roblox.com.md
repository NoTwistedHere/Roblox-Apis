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
}
```
<hr>


