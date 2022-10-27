import socket

#Creating socket object
soc = socket.socket()
print("Ser: Socket created")

#Server listens to the below port
port = 4401

#The first field is an IP field
#Leaving it empty makes the server to listen to all the requests coming from its network
soc.bind(('', port))


soc.listen(5)
print("Ser: Socket is listening")

while True:

    con, addr = soc.accept()
    print("Ser: Client connection addr:", addr)

    con.send('Message received'.encode())
    con.close()
    break


