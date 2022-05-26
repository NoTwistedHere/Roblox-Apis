# <b>CdnProviders Api v1</b>

## /v1/cdnproviders/configuration
```json
{
    "Method": "GET",
    "Description": "Gets an configuration for all CDNs",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "accessKey",
        }
    },
    "Responses": {
        "200": {
            "description": "",
            "schema": {
                "$ref": {
                    "properties": {
                        "data": {
                            "items": {
                                "$ref": {
                                    "properties": {
                                        "domainsEnabled": {
                                            "$ref": {
                                                "properties": {
                                                    "assets": {
                                                        "type": "boolean"
                                                    },
                                                    "setup": {
                                                        "type": "boolean"
                                                    },
                                                    "images": {
                                                        "type": "boolean"
                                                    },
                                                    "js": {
                                                        "type": "boolean"
                                                    },
                                                    "static": {
                                                        "type": "boolean"
                                                    },
                                                    "thumbnails": {
                                                        "type": "boolean"
                                                    },
                                                    "css": {
                                                        "type": "boolean"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "globalEnabled": {
                                            "type": "boolean"
                                        },
                                        "cdnName": {
                                            "type": "string"
                                        },
                                        "marketWeights": {
                                            "additionalProperties": {
                                                "type": "number",
                                                "format": "double"
                                            },
                                            "type": "object"
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
        }
    },
    "Internal": false
}
```
<hr>


