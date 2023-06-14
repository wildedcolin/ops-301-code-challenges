import requests

# Prompt user for destination URL
destination_url = input("Enter the destination URL: ")

# Prompt user for confirmation
confirm = input("Request will be sent to {}. Confirm? (y/n): ".format(destination_url))

if confirm.lower() == "y":
    # Perform the GET request
    response = requests.get(destination_url)

    # Print the entire request
    print("\nRequest Sent:")
    print("URL:", response.url)
    print("Method:", response.request.method)
    print("Headers:", response.request.headers)

    # Translate status code to plain terms
    status_codes = {
        200: "OK",
        201: "Created",
        204: "No Content",
        400: "Bad Request",
        401: "Unauthorized",
        403: "Forbidden",
        404: "Not Found",
        500: "Internal Server Error"
    }

    # Print response status
    if response.status_code in status_codes:
        print("\nResponse Status:", status_codes[response.status_code])
    else:
        print("\nResponse Status:", response.status_code)

    # Print response headers
    print("\nResponse Headers:")
    for key, value in response.headers.items():
        print(key + ": " + value)

else:
    print("Request cancelled by user.")
