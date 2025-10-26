Using pipx (an alternative, cleaner method)

If you want to install a Python utility so that it is available globally but doesn't clutter your system packages, use pipx.

Install pipx via apt (it may be pre-installed in newer versions of Kali):

bash sudo apt install pipx -y

Add the pipx directory to your $PATH if it isn't automatically added:

bash pipx ensurepath

To install the Hugging Face CLI via pipx, use the following command, specifying the correct package name:

bash pipx install "huggingface_hub[cli]"

First, install curl using the package manager. The prompt correctly suggests using apt.

bash sudo apt install curl

Instead of piping to sh, pipe the script to bash so it is executed with the correct interpreter. This will resolve the syntax error.

bash curl -fsSL https://ollama.com/install.sh | bash

After installation, you need to download the language model. You can choose any of the available models on the Ollama website. For this example, we will use llama3, one of the most popular and effective models.

bash ollama run llama3

Use Ctrl + d or /bye to exit.

/bye

Creating a custom shull command. To access the model as a system command, you need to create a script and set up an alias for it. Creating the script

Open a text editor and create a file, for example, named ollama_cli.sh.

bash nano ~/ollama_cli.sh

Insert the following code into it, which will pass your query to the model and then print the response:

bash #!/bin/bash
Concatenate all arguments into one string

PROMPT=$(printf "%s" "$@")
Send the query to Ollama and print only the generated text

ollama run llama3 "$PROMPT"

Save the file and close the editor (Ctrl+X, then Y and Enter).

Granting Execution Permissions: Make the script executable:

bash chmod +x ~/ollama_cli.sh

Setting Up an Alias: Now let's create an alias to call the script with the shull command.

Open your shell configuration file (e.g., .bashrc for Bash or .zshrc for Zsh):

bash nano ~/.bashrc # or nano ~/.zshrc

Add the following line to the very bottom of the file, which will create an alias named shull for our script:

bash alias shull="~/ollama_cli.sh"

Save the file and close the editor (Ctrl+X, then Y and Enter).

Refresh the shell configuration for the changes to take effect:

bash source ~/.bashrc # or source ~/.zshrc

Using the shull command: Now you can access your local AI model directly from the terminal. Examples:

bash shull "Write a small bash script to backup a folder"

bash shull "Explain how the SHA-256 algorithm works"

bash shull "Compose a joke about the terminal and Linux"

This will allow you to use Ollama as if it were another system utility that's always at hand.
