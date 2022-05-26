# <b>ClientSettings Api v2</b>

## /v2/client-version/{binaryType}
```json
{
    "Method": "GET",
    "Description": "Get client version information for specific binary type",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "binaryType",
            "required": true,
            "description": "Platform(WindowsPlayer, WindowsStudio, MacPlayer or MacStudio) for which we want the latest version"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "nextClientVersionUpload": {
                            "type": "string"
                        },
                        "version": {
                            "type": "string"
                        },
                        "clientVersionUpload": {
                            "type": "string"
                        },
                        "nextClientVersion": {
                            "type": "string"
                        },
                        "bootstrapperVersion": {
                            "type": "string"
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


## /v2/settings/application/{applicationName}
```json
{
    "Method": "GET",
    "Description": "Returns the complete settings dictionary for a Roblox client application.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "applicationName",
            "required": true,
            "description": "The name of the client application."
        },
        "2": {
            "in": "header",
            "type": "string",
            "name": "True-Client-IP",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "applicationSettings": {
                            "additionalProperties": {
                                "type": "string"
                            },
                            "type": "object"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "1: The application name is invalid."
        },
        "400": {
            "description": "1: The application name is invalid."
        }
    },
}
```
<hr>


## /v2/client-version/{binaryType}/channel/{channelName}
```json
{
    "Method": "GET",
    "Description": "Get client version information for specific binary type",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "binaryType",
            "required": true,
            "description": "Platform(WindowsPlayer, WindowsStudio, MacPlayer or MacStudio) for which we want the latest version"
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "channelName",
            "required": true,
            "description": "Channel Name"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "nextClientVersionUpload": {
                            "type": "string"
                        },
                        "version": {
                            "type": "string"
                        },
                        "clientVersionUpload": {
                            "type": "string"
                        },
                        "nextClientVersion": {
                            "type": "string"
                        },
                        "bootstrapperVersion": {
                            "type": "string"
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


## /v2/user-channel
```json
{
    "Method": "GET",
    "Description": "Get channel name for currently logged in user",
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
                    "description": "Response data object for getting a user's channel information.",
                    "properties": {
                        "channelName": {
                            "type": "string"
                        }
                    }
                }
            }
        }
    },
}
```
<hr>


## /v2/settings/secured-settings-internal/{applicationName}
```json
{
    "Method": "GET",
    "Description": "Returns the complete settings dictionary for a Roblox client application for internal dev use only.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "applicationName",
            "required": true,
            "description": "The name of the client application."
        },
        "2": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Api-Key",
            "description": "API Key for request",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "applicationSettings": {
                            "additionalProperties": {
                                "type": "string"
                            },
                            "type": "object"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "3: The api key is invalid.\r\n4: The Ip address is invalid."
        },
        "400": {
            "description": "1: The application name is invalid."
        }
    },
}
```
<hr>


## /v2/settings/secured-settings/{applicationName}/bucket/{bucketName}
```json
{
    "Method": "GET",
    "Description": "Returns the complete settings dictionary for a RCC-only Roblox client application.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "applicationName",
            "required": true,
            "description": "The name of the client application."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "bucketName",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Api-Key",
            "description": "API Key for request",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "applicationSettings": {
                            "additionalProperties": {
                                "type": "string"
                            },
                            "type": "object"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "3: The api key is invalid.\r\n4: The Ip address is invalid."
        },
        "400": {
            "description": "1: The application name is invalid."
        }
    },
}
```
<hr>


## /v2/settings/application/{applicationName}/bucket/{bucketName}
```json
{
    "Method": "GET",
    "Description": "Returns the complete settings dictionary for a Roblox client application.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "applicationName",
            "required": true,
            "description": "The name of the client application."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "bucketName",
            "required": true
        },
        "3": {
            "in": "header",
            "type": "string",
            "name": "True-Client-IP",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "applicationSettings": {
                            "additionalProperties": {
                                "type": "string"
                            },
                            "type": "object"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "1: The application name is invalid."
        },
        "400": {
            "description": "1: The application name is invalid.\r\n5: The bucket name is invalid."
        }
    },
}
```
<hr>


## /v2/settings/secured-settings/{applicationName}
```json
{
    "Method": "GET",
    "Description": "Returns the complete settings dictionary for a RCC-only Roblox client application.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "applicationName",
            "required": true,
            "description": "The name of the client application."
        },
        "2": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Api-Key",
            "description": "API Key for request",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "applicationSettings": {
                            "additionalProperties": {
                                "type": "string"
                            },
                            "type": "object"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "3: The api key is invalid.\r\n4: The Ip address is invalid."
        },
        "400": {
            "description": "1: The application name is invalid."
        }
    },
}
```
<hr>


## /v2/settings/secured-settings-internal/{applicationName}/bucket/{bucketName}
```json
{
    "Method": "GET",
    "Description": "Returns the complete settings dictionary for a Roblox client application for internal dev use only.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "applicationName",
            "required": true,
            "description": "The name of the client application."
        },
        "2": {
            "in": "path",
            "type": "string",
            "name": "bucketName",
            "required": true,
            "description": ""
        },
        "3": {
            "in": "header",
            "type": "string",
            "name": "Roblox-Api-Key",
            "description": "API Key for request",
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "properties": {
                        "applicationSettings": {
                            "additionalProperties": {
                                "type": "string"
                            },
                            "type": "object"
                        }
                    },
                    "type": "object"
                }
            }
        },
        "403": {
            "description": "3: The api key is invalid.\r\n4: The Ip address is invalid."
        },
        "400": {
            "description": "1: The application name is invalid."
        }
    },
}
```
<hr>


