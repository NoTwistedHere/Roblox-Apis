# <b>Metrics Api v1</b>

## /v1/csp/report
```json
{
    "Method": "POST",
    "Description": "Handles content security policy reports.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report",
        "4": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report"
    },
    "Parameters": {
        "1": {
            "in": "body",
            "required": true,
            "schema": {
                "$ref": {
                    "properties": {
                        "csp-report": {
                            "$ref": {
                                "type": "object",
                                "description": "Standard content security policy report sent by browsers.\r\nhttps://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only#Sample_violation_report",
                                "properties": {
                                    "original-policy": {
                                        "description": "The original policy as specified by the Content-Security-Policy-Report-Only HTTP header.",
                                        "type": "string"
                                    },
                                    "effective-directive": {
                                        "description": "The directive whose enforcement caused the violation.",
                                        "type": "string"
                                    },
                                    "violated-directive": {
                                        "description": "The name of the policy section that was violated.",
                                        "type": "string"
                                    },
                                    "document-uri": {
                                        "description": "The URI of the document in which the violation occurred.",
                                        "type": "string"
                                    },
                                    "blocked-uri": {
                                        "description": "The URI of the resource that was blocked from loading by the Content Security Policy.\r\nIf the blocked URI is from a different origin than the document-uri, then the blocked URI is truncated to contain just the scheme, host, and port.",
                                        "type": "string"
                                    },
                                    "referrer": {
                                        "description": "The referrer of the document in which the violation occurred.",
                                        "type": "string"
                                    },
                                    "status-code": {
                                        "format": "int32",
                                        "description": "The HTTP status code of the resource on which the global object was instantiated.",
                                        "type": "integer"
                                    },
                                    "disposition": {
                                        "description": "Whether the Content-Security-Policy header or the Content-Security-Policy-Report-Only header is used.",
                                        "type": "string"
                                    },
                                    "script-sample": {
                                        "description": "The first 40 characters of the inline script, event handler, or style that caused the violation.",
                                        "type": "string"
                                    }
                                }
                            }
                        }
                    },
                    "type": "object"
                }
            },
            "name": "request"
        },
        "2": {
            "in": "query",
            "type": "string",
            "name": "type",
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
        "400": {
            "description": "1: Missing report"
        }
    },
    "Internal": true
}
```
<hr>


## /v1/thumbnails/metadata
```json
{
    "Method": "GET",
    "Description": "Get metadata related to logging thumbnail load metrics.
e.g. ThumbnailLoadLoggingRatio",
    "Produces": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report"
    },
    "Parameters": "NONE",
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Response for thumbnail metrics related metadata.",
                    "properties": {
                        "logRatio": {
                            "format": "double",
                            "description": "The probability that the metrics get logged",
                            "type": "number"
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


## /v1/performance/send-measurement
```json
{
    "Method": "POST",
    "Description": "Sends a measurement to the counter.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report",
        "4": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report"
    },
    "Parameters": {
        "1": {
            "in": "body",
            "name": "measure",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request to add measurement.",
                    "properties": {
                        "excludeCountry": {
                            "description": "Exclude country",
                            "type": "boolean"
                        },
                        "measureName": {
                            "description": "The measure name to use.",
                            "type": "string"
                        },
                        "metricsType": {
                            "enum": {
                                "1": "Sequence",
                                "2": "Counter"
                            },
                            "description": "Metrics type (default sequence)",
                            "type": "string"
                        },
                        "value": {
                            "format": "double",
                            "description": "The value to add.",
                            "type": "number"
                        },
                        "featureName": {
                            "description": "The feature name to measure.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The measurement to report."
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
        }
    },
    "Internal": true
}
```
<hr>


## /v1/performance/measurements
```json
{
    "Method": "POST",
    "Description": "Sends a list of measurements to the counter.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report",
        "4": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report"
    },
    "Parameters": {
        "1": {
            "in": "body",
            "name": "measures",
            "required": true,
            "schema": {
                "items": {
                    "$ref": {
                        "type": "object",
                        "description": "Request to add measurement.",
                        "properties": {
                            "excludeCountry": {
                                "description": "Exclude country",
                                "type": "boolean"
                            },
                            "measureName": {
                                "description": "The measure name to use.",
                                "type": "string"
                            },
                            "metricsType": {
                                "enum": {
                                    "1": "Sequence",
                                    "2": "Counter"
                                },
                                "description": "Metrics type (default sequence)",
                                "type": "string"
                            },
                            "value": {
                                "format": "double",
                                "description": "The value to add.",
                                "type": "number"
                            },
                            "featureName": {
                                "description": "The feature name to measure.",
                                "type": "string"
                            }
                        }
                    }
                },
                "type": "array"
            },
            "description": "The list of measurements to report."
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
        }
    },
    "Internal": true
}
```
<hr>


## /v1/games/join-rate
```json
{
    "Method": "GET",
    "Description": "Records game join rates.",
    "Produces": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "category",
            "required": true
        },
        "2": {
            "in": "query",
            "type": "integer",
            "name": "placeId",
            "format": "int64",
            "required": true
        },
        "3": {
            "in": "query",
            "type": "string",
            "name": "result",
            "required": true
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
        }
    },
    "Internal": true
}
```
<hr>


## /v1/bundle-metrics/report
```json
{
    "Method": "POST",
    "Description": "Records bundle load successes.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report",
        "4": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report"
    },
    "Parameters": {
        "1": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request parameters for tracking a bundle load.",
                    "properties": {
                        "cdnProviderName": {
                            "description": "The CDN that served the bundle.",
                            "type": "string"
                        },
                        "loadTimeInMilliseconds": {
                            "format": "int64",
                            "description": "How long it took to load.",
                            "type": "integer"
                        },
                        "loadState": {
                            "enum": {
                                "1": "Unknown",
                                "2": "LoadSuccess",
                                "3": "LoadFailure",
                                "4": "ExecutionFailure"
                            },
                            "description": "Whether or not the bundle loaded successfully.",
                            "type": "string"
                        },
                        "bundleUrl": {
                            "description": "The bundle url that loaded.",
                            "type": "string"
                        },
                        "bundleName": {
                            "description": "The name of the bundle.",
                            "type": "string"
                        },
                        "bundleContentType": {
                            "enum": {
                                "1": "Unknown",
                                "2": "JavaScript",
                                "3": "Css"
                            },
                            "description": "The content type of the bundle.",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Request parameters for tracking a bundle load.}."
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
        "400": {
            "description": "1: The bundle url is invalid."
        }
    },
    "Internal": false
}
```
<hr>


## /v1/thumbnails/load
```json
{
    "Method": "POST",
    "Description": "Records the time it takes for a thumbnail to get loaded in the UI.",
    "Consumes": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report",
        "4": "application/x-www-form-urlencoded"
    },
    "Produces": {
        "1": "application/json",
        "2": "text/json",
        "3": "application/csp-report"
    },
    "Parameters": {
        "1": {
            "in": "body",
            "name": "request",
            "required": true,
            "schema": {
                "$ref": {
                    "type": "object",
                    "description": "Request to add measurement.",
                    "properties": {
                        "thumbnailType": {
                            "description": "The type of thumbnail.",
                            "type": "string"
                        },
                        "duration": {
                            "format": "int32",
                            "description": "The time it took in milliseconds for final thumbnail to load",
                            "type": "integer"
                        },
                        "loadState": {
                            "enum": {
                                "1": "Unknown",
                                "2": "Complete",
                                "3": "Timeout"
                            },
                            "description": "The load state. {Roblox.Metrics.Api.ThumbnailLoadState}",
                            "type": "string"
                        }
                    }
                }
            },
            "description": "The {Request to add measurement.}."
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
            "description": "2: A required parameter is missing from the request"
        }
    },
    "Internal": false
}
```
<hr>


