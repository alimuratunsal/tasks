# Reads the user information from a txt file, and prints the duplicated users

# opens the file
fileRead = open("passwd_file.txt","r")
lines = fileRead.readline()
line = lines.strip().split(':')

index = 0
user = []
userID = []


while lines:
    line = lines.strip().split(':')
    lines = fileRead.readline()
    user.append(line[0])
    userID.append(line[1])


for i in range(0,len(userID)):
    for j in range(i+1,len(userID)):
        if (userID[i] == userID[j]):
            print(userID[j] + ": " + user[i] + ", " + user[j])
