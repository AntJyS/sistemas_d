import socket

def connect_to_server(host, port, phone_number):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((host, port))
        s.send(phone_number.encode())
        response = s.recv(1024).decode()
        return response

def main():
    host = 'localhost'
    port = 12345
    phone_number = input("Entra el numero de telefono: ")

    try:
        response = connect_to_server(host, port, phone_number)
        print(response)
    except ConnectionError:
        print("Fallo de coneccion con el servidor")
    except Exception as e:
        print(f"Ha ocurrido un error: {e}")

if __name__ == '__main__':
    main()

