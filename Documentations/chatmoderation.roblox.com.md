# Chat Moderation

# /v1/users/{userId}/conversations

```json
{
    Method: "GET",
    Description: "Retrieve all the conversations for a user",
    Produces: [
        "application/json",
        "text/json"
    ],
    Parameters: {
        userId: 1, // Int64, Required, The user's id
        limit: 20, // Int32, Optional Query, The amount of results per request
        cursor: "" // Optional Query, The paging cursor for the previous or next page
    },
    Responses: {
        200: "OK",
        400: "1: Invalid user id",
        401: "3: The User has insufficient permissions to perform this action"
    }
}
```
<hr>

# /v1/users/{userId}/conversations/{conversationId}/export

```json
{
    Method: "GET",
    Description: "Exports chat conversation messages to csv file",
    Produces: [
        "application/json",
        "text/json"
    ],
    Parameters: {
        userId: 1, // Int64, Required, The target user id
        conversationId: 20, // Int64, Required, The conversation id
        inclusiveStartDate: "", // Optional Query
        exclusiveEndDate: "" // Optional Query
    },
    Responses: {
        200: "OK",
        400: "0: Conversation is not valid.\r\n1: User is not valid.",
        401: "2: User is not authorized to export user platform chat.",
        500: "3: Processing error has occured."
    }
}
```
<hr>

# /v1/users/{userId}/conversations/{conversationId}/messages

```json
{
    Method: "GET",
    Description: "Exports chat conversation messages to csv file",
    Produces: [
        "application/json",
        "text/json"
    ],
    Parameters: {
        userId: 1, // Int64, Required, The user id
        conversationId: 20, // Int64, Required, The conversation id
        limit: 20, // Optional Query, The amount of results per request.
        cursor: "", // Optional Query, The paging cursor for the previous or next page.
        sortOrder: "Asc OR Desc" // Enum, Optional Query, The order the results are sorted in.
    },
    Responses: {
        200: "OK",
        400: "1: Invalid user id\r\n2: Invalid conversation id",
        401: "3: The User has insufficient permissions to perform this action"
    }
}
```
<hr>
