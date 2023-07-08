import os
import msvcrt

def clear_screen():
    # Clear the screen depending on the operating system
    if os.name == 'nt':  # For Windows
        os.system('cls')
    else:  # For Linux and macOS
        os.system('clear')

def action_option1():
    os.system("git config --global http.proxy http://127.0.0.1:7890")
    os.system("git config --global https.proxy https://127.0.0.1:7890")
    print("This is option 1. Git proxy turned on.")

def action_option2():
    os.system("git config --global --unset http.proxy")
    os.system("git config --global --unset https.proxy")
    print("This is option 2. Git proxy turned off.")

def main():
    # Define menu options
    options = ['On', 'Off']
    actions = [action_option1, action_option2]
    current_option = 0

    # Loop to display and handle user input
    while True:
        clear_screen()  # Clear the screen

        # Display menu options
        for i, option in enumerate(options):
            # Highlight the current option
            if i == current_option:
                print(f' > {option} < ')
            else:
                print(f'   {option}   ')

        # Display the prompt to quit the program
        print("\nPress 'q' to quit the program.")

        # Get user input
        key = msvcrt.getch()

        # Handle user input
        if key == b'\r':
            # User pressed Enter, confirm selection
            selected_option = options[current_option]
            print(f'Selected: {selected_option}')
            # Perform the action associated with the selected option
            actions[current_option]()
            break
        elif key in [b'j', b'K']:
            # User pressed 'j' or 'K', move to the next option
            current_option = (current_option + 1) % len(options)
        elif key in [b'k', b'H']:
            # User pressed 'k' or 'H', move to the previous option
            current_option = (current_option - 1) % len(options)
        elif key == b'q':
            # User pressed 'q', quit the program
            print("Program is quitting...")
            return

# Run the program
if __name__ == '__main__':
    main()
