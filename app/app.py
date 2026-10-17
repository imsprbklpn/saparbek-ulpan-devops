import os
import time

name = os.getenv("STUDENT_NAME", "Ulpan")
surname = os.getenv("STUDENT_SURNAME", "Saparbek")
group = os.getenv("STUDENT_GROUP", "IT2-2310")
student_id = os.getenv("STUDENT_ID", "37615")

print("=" * 32)
print("DevOps Student Application")
print("=" * 32)
print()
print(f"Name: {name}")
print(f"Surname: {surname}")
print(f"Group: {group}")
print(f"Student ID: {student_id}")
print()
print("Application is running successfully!", flush=True)

# KEEP_ALIVE=1 keeps the container running (for logs / exec / compose demo)
if os.getenv("KEEP_ALIVE") == "1":
    n = 0
    while True:
        n += 1
        print(f"[heartbeat {n}] container is alive", flush=True)
        time.sleep(5)
