import socket
import mysql.connector

def create_server_socket(host='localhost', port=12345):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind((host, port))
    s.listen(5)
    print(f"Socket is listening on {host}:{port}")
    return s

def query_database(phone_number):
    with mysql.connector.connect(
        host="socket-server-mysql",
        user="root",
        password="52647654327",
        database="socket_server"
    ) as db_connection:
        cursor = db_connection.cursor()
        query = """
        SELECT p.dir_tel, p.dir_nombre, p.dir_tipo_tel, p.dir_direccion, c.ciud_nombre
        FROM personas p
        INNER JOIN ciudades c ON p.dir_ciud_id = c.ciud_id
        WHERE p.dir_tel = %s
        """
        cursor.execute(query, (phone_number,))
        return cursor.fetchone()

def main():
    with create_server_socket() as server_socket:
        while True:
            client, addr = server_socket.accept()
            with client:
                print(f"Got connection from {addr}")
                phone_number = client.recv(1024).decode()

                result = query_database(phone_number)

                if result:
                    client.sendall(str(result).encode())
                else:
                    client.sendall("User not found".encode())

if __name__ == '__main__':
    main()
