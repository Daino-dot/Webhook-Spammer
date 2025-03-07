import time
import requests
import pyfiglet

print(pyfiglet.figlet_format("Daino"))

msg = input().strip()
webhook = input().strip()
count = int(input().strip())
sleep_time = float(input().strip())  

for i in range(count):
    try:
        data = requests.post(webhook, json={'content': msg})
        if data.status_code == 204:
            print(f"Sent MSG {i + 1}/{count}")
        else:
            print(f"Error: {data.status_code}")
    except Exception as e:
        print(f"Failed to send message: {e}")
        break
    time.sleep(sleep_time)  

print("\nAttack completed!")
