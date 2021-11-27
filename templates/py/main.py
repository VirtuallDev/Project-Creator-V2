import requests

def get_ip():
    return requests.get('https://api.ipify.org/').text

def main():
    print(f"Hello User!\nYour IP is: {get_ip()}")

if __name__ == "__main__":
	main()
