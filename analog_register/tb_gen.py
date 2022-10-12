

with open("hw/analog_regs.vhd", 'r') as file:
	lines = file.readlines()

s = '\n'.join(lines)

idx_begin = s.find("-- Local Bus interface")

w_regs = {}
r_regs = {}

idx_last = idx_begin
found = 1
while(found):
	try:
		id_start = "rdata(31 downto "
		id_size = ")"
		id_addr = "waddr = "
		id_raddr = "raddr = "

		idx_next = s.find(id_start, idx_last)
		if idx_next == -1:
			print("eof")
			break
		else:
			idx_next += len(id_start)

		idx_size = s.find(id_size, idx_next)
		size = int(s[idx_next:idx_size])

		idx_addr = s.find(id_addr, idx_size, idx_size + 120)
		if idx_addr == -1:
			idx_addr = s.find(id_raddr, idx_size, idx_size + 220) + len(id_raddr)
			if idx_addr != len(id_raddr) -1:
				addr = int(s[idx_addr+1:idx_addr+33],2)
				r_regs[addr] = size
				print(f"reg {hex(addr)}: {size:>2} bits -- ro")
			
			continue

		idx_addr += len(id_addr)
		addr = int(s[idx_addr+1:idx_addr+33],2)
		w_regs[addr] = size
		print(f"reg {hex(addr):<5}: {size:>2} bits")

	finally:
		idx_last = idx_next


print(f"{len(w_regs.keys()):>2} writable registers found")
print(f"{len(r_regs.keys()):>2} readonly registers found")
print("todo: build TB that fills with chess pattern")