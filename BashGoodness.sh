## Capture CTRL+C
trap some_function SIGINT

## Redirect output from within a script
exec > out.log 2>&1

## dreference symbolic link
readlink -f /path/to/symlink

## Path to executing script
$BASH_SOURCE
	
## Read from a pipe line by line
while read line; do 
echo $line; 
done < <(find /tmp/ -type f)


## Read from a file line by line
while read line; do 
echo $line; 
done < /etc/passwd

## Read a line, including line breaks
read -r 

## Read a line without displaying it as it is typed. For password prompts
read -s

## multi line cat
cat > foo.txt << EOF
hello
world
EOF


## Conditionally execute multiple commands based on return status from a call
touch /tmp/foo && { echo great; echo success; } || { echo epic; echo fail; }

## Get terminal width
tput cols

## Get last argument
echo "${@: -1}"

## One line usage
[ -z "$*" ] && echo Usage: $0 [properties file]... && exit 1


## View a manfile
zcat foo.1.gz | gtbl | nroff -c -mandoc | less -is

## remove a prefix from a string
str="/dev/pts/1"
str=${str#/dev/}

## Remove last character from a string
echo ${foo:0:${#foo} - 1}

## Split a string into an array
IFS=', ' read -a foo <<< $line; echo ${foo[1]}

## String contains
if [[ $string == *Foo* ]]; then

## Uppercase/Lowercase strings
echo ${foo^^}
echo ${foo,,}
