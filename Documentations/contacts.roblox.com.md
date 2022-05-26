# <b>Contacts Api v1</b>

## /v1/user/set-pending-tag
```json
{
    "Method": "POST",
    "Description": "Sets the pending tag for a user",
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
                        "userTag": {
                            "description": "The userTag to be set",
                            "type": "string"
                        },
                        "targetUserId": {
                            "format": "int64",
                            "description": "The userId of the target of the userTag.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The pending tag receiving userId and the pending tag itself"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: The user cannot tag themselves."
        },
        "400": {
            "description": "2: The target user is invalid or does not exist.\r\n4: Invalid parameters.\r\n6: The userTag is too long."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success",
                                "2": "Moderated"
                            },
                            "description": "Status message to be sent to the setter of the userTag",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "10: The flood limit has been exceeded."
        }
    },
}
```
<hr>


## /v1/contacts/metadata
```json
{
    "Method": "GET",
    "Description": "Gets contextual information for contacts and usertags",
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
                        "multiGetContactsMaxSize": {
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
}
```
<hr>


## /v1/user/get-tags
```json
{
    "Method": "POST",
    "Description": "Gets the tags for multiple users",
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
                        "targetUserIds": {
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
            "description": ""
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "items": {
                    "$ref": {
                        "properties": {
                            "targetUserTag": {
                                "type": "string"
                            },
                            "targetUserId": {
                                "type": "integer",
                                "format": "int64"
                            }
                        },
                        "type": "object"
                    }
                },
                "type": "array"
            }
        },
        "429": {
            "description": "10: The flood limit has been exceeded."
        },
        "400": {
            "description": "4: Invalid parameters.\r\n8: Too many user Tags are requested."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        }
    },
}
```
<hr>


## /v1/user/tag
```json
{
    "Method": "POST",
    "Description": "Sets the tag for a user",
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
                        "userTag": {
                            "description": "The userTag to be set",
                            "type": "string"
                        },
                        "targetUserId": {
                            "format": "int64",
                            "description": "The userId of the target of the userTag.",
                            "type": "integer"
                        }
                    },
                    "type": "object"
                }
            },
            "description": "The tag receiving userId and the tag itself"
        }
    },
    "Responses": {
        "403": {
            "description": "0: Token Validation Failed\r\n5: The user cannot tag themselves."
        },
        "400": {
            "description": "2: The target user is invalid or does not exist.\r\n4: Invalid parameters.\r\n6: The userTag is too long."
        },
        "401": {
            "description": "0: Authorization has been denied for this request."
        },
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "status": {
                            "enum": {
                                "1": "Success",
                                "2": "Moderated"
                            },
                            "description": "Status message to be sent to the setter of the userTag",
                            "type": "string"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "429": {
            "description": "10: The flood limit has been exceeded."
        }
    },
}
```
<hr>


