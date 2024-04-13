import socket

def scan_network():
    base_ip = '172.16.1.'
    available_ips = []

    for i in range(1, 256):
        ip = base_ip + str(i)
        try:
            socket.create_connection((ip, 22), timeout=1)
            available_ips.append(ip)
        except (socket.timeout, OSError):
            pass

    return available_ips

if __name__ == "__main__":
    ips = scan_network()
    for ip in ips:
        print(ip)
