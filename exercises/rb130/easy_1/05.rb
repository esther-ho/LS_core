LOWER = ('a'..'z').to_a * 2
UPPER = ('A'..'Z').to_a * 2

def decrypt(names)
  names.map do |name|
    name.gsub(/[a-z]/i) do |char|
      if char =~ /[a-z]/
        LOWER[LOWER.rindex(char) - 13]
      else
        UPPER[UPPER.rindex(char) - 13]
      end
    end
  end
end

names = <<-LIST
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
LIST

names = names.split("\n")
puts decrypt(names)

# Without reference and using ASCII

def decrypt_name(names)
  names.map do |name|
    name.gsub(/[a-z]/i) { |char| decrypt_char(char) }
  end
end

def decrypt_char(char)
  case char
  when 'A'..'M', 'a'..'m' then (char.ord + 13).chr   
  else                         (char.ord - 13).chr
  end
end

puts decrypt_name(names)
