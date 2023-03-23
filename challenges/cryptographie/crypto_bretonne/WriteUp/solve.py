flog = bytes.fromhex("85de6affbe5e2f20282d373b2808")
flag_format = b"BZHCTF{"
print(flag_format+bytes([c^d for c,d in zip(flog[7:],flag_format)])+b"}")
