# Introducing easydir.vim

URL: https://dockyard.com/blog/2013/12/08/introducing-easydir-vim

URL: https://github.com/duggiefresh/vim-easydir

It adds to the functionality of `:new`, `:edit`, `:write`, and more.

Here are some quick examples:

Edit a new file inside of a previously nonexistent directory.
```
:e new_directory/new_file.txt

# Write some things to "new_file.txt" and save it.

:w

# The directory "new_directory/" and the file "new_file.txt"
# are saved!
```

Open the new directory and file into a split window.

```
:sp another_directory/another_file.txt

# Write to "another_file.txt" and save the file.

:w

# another_directory/another_file.txt is saved!
```

Super nested directories
```
:n thank/you/sir/may/i/have/another.txt

# Write some things to "another.txt" and save it.

:w
The directories and files will be saved under your current project’s directory.
```

