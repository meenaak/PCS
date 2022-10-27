import socket

#Creating socket object
soc = socket.socket()

#Port the client wants to connect
port = 4401

soc.connect(('127.0.0.1', port))

print("Client:", soc.recv(1024).decode())


#Closing connection
soc.close()

