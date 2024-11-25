const axios = require("axios").default;
const qs = require('qs');

async function _getQuotationLalaMoveCall(context, ffVariables) {
  if (!context.auth) {
    return _unauthenticatedResponse;
  }
  var authToken = ffVariables["authToken"]?? "274358006c2ee90d6931b7f2c400c14ab69f74568166c2478a456ec282a3af5c0f040152cc0f3010d23256d1369d10319e49df12ccc0962f17625ad49b9132832ab2b8528f66b39ee600197a8d3def7db0e8bbc0fff8e09a96b5e34c68e2dd29684de20a38a6e196738b1e092a403e508f94a3310a7d00bdf94d9540a67bebd6";
  var latSender = ffVariables["latSender"];
  var lngSender = ffVariables["lngSender"];
  var latReceiver = ffVariables["latReceiver"];
  var lngReceiver = ffVariables["lngReceiver"];
  var addressSender = ffVariables["addressSender"];
  var addressReceiver = ffVariables["addressReceiver"];

  var url = `https://getquotationlalamove-667069547103.us-central1.run.app`;
  var headers = {};
  var params = {};
  var ffApiRequestBody = `
{
  "auth_token": "${authToken}",
  "body": {
    "data": {
      "serviceType": "LALAGO",
      "language": "pt_BR",
      "stops": [
        {
          "coordinates": {
            "lat": "${latSender}",
            "lng": "${lngSender}"
          },
          "address": "${addressSender}"
        },
        {
          "coordinates": {
            "lat": "${latReceiver}",
            "lng": "${lngReceiver}"
          },
          "address": "${addressReceiver}"
        }
      ],
      "item": {
        "quantity": "1",
        "weight": "LESS_THAN_3KG"
      }
    }
  }
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}


/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    "GetQuotationLalaMoveCall": _getQuotationLalaMoveCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: (isStreamingApi ? 'stream' : 'json'),
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}

module.exports = { makeApiCall };
