import requests
import json

get_url = 'https://employee.jollytree-b7a870f9.centralindia.azurecontainerapps.io/gilhari/v1/Employee'
post_url = 'https://employee.jollytree-b7a870f9.centralindia.azurecontainerapps.io/gilhari/v1/Employee'

def get_call(url, filterKey=None, filterVal=None, deep=None, maxObjects=None):
    # Update URL as per query parameters
    if filterKey is not None and filterVal is not None:
        url += '?filter=' + str(filterKey) + '=' + str(filterVal)
    elif deep is not None:
        url += '?deep=' + str(deep)
    elif maxObjects is not None:
        url += '?maxObjects=' + str(maxObjects)

    try:
        response = requests.get(url)

        if response.status_code == 200:
            print("Successfully called GET API")
            print("GET Response data: ")
            print(response.json())
        else:
            print(f"Error: {response.status_code}")

    except requests.exceptions.RequestException as e:
        print(f"Request error: {e}")

def post_call(url, dataDump):
    try:
        headers = {'Content-type': 'application/json'}
        response = requests.post(url, json=dataDump, headers=headers)

        if response.status_code == 201:
            print("Successfully inserted values")
        else:
            print(f"Error: {response.status_code}")

    except requests.exceptions.RequestException as e:
        print(f"Request error: {e}")

def main():
    choice = input("Do you want to get data or post data? (get/post): ").strip().lower()

    if choice == 'get':
        max_objects = input("Enter the max number of objects to retrieve: ").strip()
        if max_objects.isdigit():
            get_call(get_url, maxObjects=int(max_objects))
        else:
            print("Invalid input. Please enter a numeric value for maxObjects.")
    elif choice == 'post':
        with open('entities.json', 'r') as f:
            json_data = json.load(f)
        post_call(post_url, json_data)
    else:
        print("Invalid choice. Please enter 'get' or 'post'.")

if __name__ == "__main__":
    main()

