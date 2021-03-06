import struct, socket

def wake_on_lan(ip, ethernet_address):
  addr_byte = ethernet_address.split(':')
  hw_addr = struct.pack('BBBBBB', int(addr_byte[0], 16),
    int(addr_byte[1], 16),
    int(addr_byte[2], 16),
    int(addr_byte[3], 16),
    int(addr_byte[4], 16),
    int(addr_byte[5], 16),
    )
  msg = b'\xff' * 6 + hw_addr * 16
  s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
  s.sendto(msg, (ip, 9))
  s.sendto(msg, (ip, 7))
  s.close()

wake_on_lan('your.ip.address.here', 'your:mac:address:here')