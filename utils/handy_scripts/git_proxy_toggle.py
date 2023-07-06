import os

# os.system("echo 'hello'")
# os.system("fastfetch")


toggle = input("git proxy on/off:")
if toggle.lower() == "on":
    os.system("git config --global http.proxy http://127.0.0.1:7890")
    os.system("git config --global https.proxy https://127.0.0.1:7890")
    print("git proxy on")
else:
    os.system("git config --global --unset http.proxy")
    os.system("git config --global --unset https.proxy")
    print("git proxy off")
