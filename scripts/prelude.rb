def installed?(p)
  `which #{p}`
  $?.exitstatus == 0  
end

def panic(msg)
  puts "PANIC! #{msg}"
  exit(1)
end

def ensure_bin(bin)
  panic("Could not find executable #{bin}.") if not installed?(bin)
end

def ensure_path(path)
  panic("Could not find path #{path}.") if not File.exists?(path)  
end

def ensure_args(expected)
  actual = ARGV.size
  panic("Expect #{expected} arguments but got #{actual}.") if actual != expected
end

