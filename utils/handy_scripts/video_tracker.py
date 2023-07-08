import webbrowser

# for num in range(start_num, end_num):
# 	base_url = f"https://tokyotosho.org/search.php?terms=229SCUTE-{num}&type=0&searchName=true&searchComment=true&size_min=&size_max=&username="
# 	webbrowser.open(base_url)

with open("../Videos/MISC/jav-list.txt") as file:
    for line in file:
        base_url = f"https://wuji.me/search?q={line}"
        webbrowser.open(base_url)
        print(line.strip())
    # count the number of codes
    # lines = file.readlines()
    # total_lines = len(lines)
    # print("Total number of lines:", total_lines)
