import pyperclip
import webbrowser
import re


def jav_search(keyword):
    base_url = f"https://wuji.me/search?q={keyword}"
    webbrowser.open(base_url)

def remove_duplicates(lst):
    return list(dict.fromkeys(lst))


# av codes regex pattern
pattern = r"\b[A-Za-z]{2,5}-\d{3,8}\b"

# text source
text_content = pyperclip.paste()

# find valid codes
original_list = re.findall(pattern, text_content.upper())
unique_list = remove_duplicates(original_list)

#loop the result list
if len(unique_list) != 0:
    for code in unique_list:
        print(code)
        jav_search(code)
else:
    print("No jav code was found.")

#clear clipboard
pyperclip.copy('')
