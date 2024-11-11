# Daily 17
This assignment deals with file I/O, and thus requires test input from several sets of files. This can be rather inconvenient, since test input must be copied from file to file for each individual test. Therefore I have created a set of template input files and a script to test the student's code using all of them.

## Usage
Copy the student's full code into main.c.

`./test_daily_17.sh [parameter]`

### Parameters
`-basic` or `-normal` : Test with normal number values in numbers1.txt and numbers2.txt.

`-1empty` or `-singleempty` : Test with normal number values in numbers1.txt and nothing in numbers2.txt.

`-empty` or `-bothempty` : Test with numbers1.txt and numbers2.txt as empty files.

`-all` : Test all of the above options in sequence.

`-clean` : Remove numbers1.txt, numbers2.txt, and output.txt.

## Requirements
This script will only work if you have access to a bash shell. If you are running on Linux or Mac OS you should have access by default, although you may need to change the first line in *test_daily_17.sh* to the correct path to bash on your computer (`#![your file path]`). If you are running on Windows you can [download Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install) for a more permanent solution or, for a short-term and slightly less convenient solution, you can [SSH to your UML CS account](https://www.uml.edu/sciences/computer-science/cs-infrastructure/unix-connectivity.aspx).