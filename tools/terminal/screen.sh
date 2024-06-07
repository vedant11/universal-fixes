screen # to start new screen session
screen -S name # start with name
screen -r # to attach to a detached screen
screen -D # to detach a session
# ctrl+a, : and then
# sessionname name
# to add session name

session -xS name # to connect directly by name
screen -S 8890.foo -X sessionname bar # to rename session from foo to bar

# ctrl+A, : to add commands
# sessionname name
# to add session name during the screen session