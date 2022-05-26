# <b>ThumbnailsResizer Api v1</b>

## /v1/resize/{hash}/{width}/{height}/{type}/{format}/{filterType}
```json
{
    "Method": "GET",
    "Description": "Resizes larger thumbnails to specified size and format",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "path",
            "type": "string",
            "name": "hash",
            "required": true,
            "description": "Hash of larger thumbnail"
        },
        "2": {
            "in": "path",
            "type": "integer",
            "name": "width",
            "format": "int32",
            "required": true,
            "description": "Desired width of thumbnail"
        },
        "3": {
            "in": "path",
            "type": "integer",
            "name": "height",
            "format": "int32",
            "required": true,
            "description": "Desired height of thumbnail"
        },
        "4": {
            "in": "path",
            "type": "string",
            "name": "type",
            "required": true,
            "description": "Thumbnail Type"
        },
        "5": {
            "in": "path",
            "type": "string",
            "name": "format",
            "required": true,
            "description": "Desired image format of the thumbnail"
        },
        "6": {
            "in": "path",
            "type": "string",
            "name": "filterType",
            "required": true,
            "description": "E.g. is output circular"
        }
    },
    "Responses": {
        "200": {
            "description": "OK",
            "schema": {
                "type": "object"
            }
        }
    },
}
```
<hr>


