# Twikker

Create a Campaign Management application

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

General requirements:

- Ruby 2.6.5
- Rails 6.0.2
- PG
- Puma Server
- ActiveModelSerializer
- ActsAsTaggableOn

## Running the app

### Check out the repo

```
$ git clone git@github.com:JayaramVenugoapl/Campaigns.git
```

```
$ cd Campaigns
```

### Setup

1. Install pg
2. Install bundler: `gem install bundler`
3. Install gems: `bundle install`
4. Setup DB: `rails db:create db:migrate;`.

### Usage

1. Start rails && react server locally

```

$ rails start

```

# RESTAPIDocs Examples

Where full URLs are provided in responses they will be rendered as if service
is running on 'http://localhost:3000/'.

## Open Endpoints

Open endpoints require no Authentication.

- `POST /api/signup/`

## Authorization

All API requests require the use of a generated API key. You can find your API key, or generate a new one, by navigating to the /settings endpoint, or clicking the “Settings” sidebar item.

To authenticate an API request, you should provide your email and password in the `Authorization` header as basic authorization token

```
curl --location --request GET 'localhost:3000/api/campaigns'  --header 'Authorization: Basic dGVzdDFAeW9wbWFpbC5jb206cXdlcnR5MTIz'
```

| Parameter | Type     | Description                  |
| :-------- | :------- | :--------------------------- |
| `api_key` | `string` | **Required**. email,password |

## Responses

Many API endpoints return the JSON representation of the resources created or edited. However, if an invalid request is submitted, or some other error occurs, returns a JSON response in the following format:

```javascript
{
  "status" : integer,
  "message" : string,
  "data"    : string
}
```

The `message` attribute contains a message commonly used to indicate errors or, in the case of deleting a resource, success that the resource was properly deleted.

The `success` attribute describes if the transaction was successful or not.

The `data` attribute contains any other metadata associated with the response. This will be an escaped string containing JSON data.

## Endpoints that require Authentication

Closed endpoints require a valid Token to be included in the header of the
request. A Token can be acquired from the Login view above.

### Campaigns related

Endpoints for viewing and manipulating the Campaigns that the Authenticated User has permissions to access.

- `GET /api/campaigns/`
- `POST /api/campaigns/`
- `GET /api/campaigns/:id/`
- `PUT /api/campaigns/:id/`
- `DELETE /api/campaigns/:id/`

### Discussion Topics related

Endpoints for viewing and manipulating the Campaign Topics that the Authenticated User has permissions to access.

- `GET /api/campaigns/:campaign_id/discussion_topic`
- `PUT /api/campaigns/:campaign_id/discussion_topic`
- `DELETE /api/campaigns/:campaign_id/discussion_topic`
- `POST /api/campaigns/:campaign_id/discussion_topic`

### Comments related

Endpoints for viewing and manipulating the Comments on Campaign that the Authenticated User has permissions to access.

- `GET /api/campaigns/:campaign_id/comments`
- `POST /api/campaigns/:campaign_id/comments`
- `GET /api/campaigns/:campaign_id/comments/:id`
- `PATCH /api/campaigns/:campaign_id/comments/:id`
- `PUT /api/campaigns/:campaign_id/comments/:id`
- `DELETE /api/campaigns/:campaign_id/comments/:id`

## Status Codes

Returns the following status codes in its API:

| Status Code | Description             |
| :---------- | :---------------------- |
| 200         | `OK`                    |
| 201         | `CREATED`               |
| 400         | `BAD REQUEST`           |
| 404         | `NOT FOUND`             |
| 500         | `INTERNAL SERVER ERROR` |
