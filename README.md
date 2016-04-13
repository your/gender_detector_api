# gender_detector_api

API-only Rails app providing fast gender names resolution.

**Production-ready** (with Procfile for Heroku).


## Dependencies

The [gender_detector](https://github.com/bmuller/gender_detector) gem is used to process the gender.


## Config

### Defaults

Change `DEFAULT_COUNTRY` and `FALLBACK_GENDER` in [`app/config/initializers/gender_detector.rb`](../blob/master/app/config/initializers/gender_detector.rb)

(default gender is `f`.. you know.. :))


### Auth

Add/replace auth tokens in [`app/config/auth.yml`](../blob/master/app/config/auth.yml)
(or implement your own authentication logic)

## Test it

* Endpoint: `POST /api/v1/gender.json`
* Mandatory params: `list`
* Optional fields: `country`

### Example
**Request:**

```
POST /api/v1/gender.json
{
  "names": {
    "country": "italy",
    "list": ["Giuseppe", "Sara", "Clara"]
  }
}
```

**Response:**

```
200 OK
{
  "names": {
    "country": "italy",
    "list": [
      {
        "name": "Giuseppe",
        "gender": "m"
      },
      {
        "name": "Sara",
        "gender": "f"
      },
        "name": "Clara",
        "gender": "f"
    ]
  }
}
```

Unathorized calls or with wrong paramters will receive a `403 Unauthorized` and `400 Bad Request` status with a blank body respectively.


## License: MIT

Copyright (C) 2016 Giuseppe Lobraico

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
