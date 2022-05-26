# <b>ContentStore Api v1</b>

## /v1/content
```json
{
    "Method": "GET",
    "Description": "Get content for a file.",
    "Produces": {
        "1": "application/json",
        "2": "text/json"
    },
    "Parameters": {
        "1": {
            "in": "query",
            "type": "string",
            "name": "hash",
            "required": true,
            "description": ""
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
            "description": "1: Unknown error\r\n3: Directory not found"
        },
        "404": {
            "description": "2: Hash not found"
        }
    },
    "Internal": false
}
```
<hr>


