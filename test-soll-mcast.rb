def orig_ipv6_soll_mcast_addr6(addr)
  h = addr.split(':')[-2, 2]
  m = []
  m << 'ff'
  m << (h[0].to_i(16) & 0xff).to_s(16)
  m << ((h[1].to_i(16) & (0xff << 8)) >> 8).to_s(16)
  m << (h[1].to_i(16) & 0xff).to_s(16)
  'ff02::1:' + [m[0,2].join, m[2,2].join].join(':')
end

def fixed_ipv6_soll_mcast_addr6(addr)
  h = addr.split(':')[-2, 2]
  m = []
  m << 'ff'
  m << (h[0].to_i(16) & 0xff).to_s(16)
  m << ((h[1].to_i(16) & (0xff << 8)) >> 8).to_s(16)
  m << (h[1].to_i(16) & 0xff).to_s(16)
  'ff02::1:' + [m[0,3].join, m[3,2].join].join(':')
end

def test(descr, unicast, expected)
  puts "--- " + descr
  puts "unicast:  " + unicast
  puts "orig:     " + orig_ipv6_soll_mcast_addr6(unicast)
  puts "fixed:    " + fixed_ipv6_soll_mcast_addr6(unicast)
  puts "expected: " + expected
end

# from https://en.wikipedia.org/wiki/Solicited-node_multicast_address
test("wiki", "fe80::2aa:ff:fe28:9c5a", "ff02::1:ff28:9c5a")
test("h12", "fe80::200:ff:fe00:3", "ff02::1:ff00:3")
