# simplest use
# dig dns_server address record_type
dig google.com
# same as dig google.com A
dig @8.8.8.8 google.com MX # using specific dns server
# for any DNS record type A, MX, NS, SOA, PTR, etc.
dig google.com ANY # or
dig @8.8.8.8 google.com -t ANY

# edit nameserver in /etc/resolv.conf; not recommended since this is automatically generated
# so check its source first

# reverse DNS lookup checks for a PTR record
# dig -x serverIP
dig -x 142.250.182.78 # gives 1 googol naming convention, interestingly: maa05s20-in-f14.1e100.net

# traceroute
dns serverIP/hostname +trace
