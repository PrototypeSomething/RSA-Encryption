require 'prime'

primes = []
Prime.each(1000) do |prime|
  primes << prime
  # p prime  #=> 2, 3, 5, 7, 11, ...., 97
end

$number1 = 0
$number2 = 0

def get_primes(primes)
  $number1 = primes[rand(1..100)]
  $number2 = primes[rand(1..100)]
  while ($number1 == $number2)
    $number2 = primes[rand(1..100)]
  end
end

get_primes(primes)

puts "number1 #{$number1}"
puts "number2 #{$number2}"

n = $number1 * $number2

def phi()
  phi = (($number1-1)*($number2-1))
  puts "phi #{phi}"
  return phi
end

mod = phi()
e = $number1

def inv_mod(num, mod)
  res = nil
  (0..mod).each do |step|
    k = (step * mod) + 1
    return k / num if k % num == 0
  end
  res
end

priv1 = [inv_mod(e, mod), n]
puts "priv1 #{priv1}"
# p priv1

pub_key = [$number1, n]
puts "pub_key #{pub_key}"
p pub_key


message = []
$i=0
while $i < 10
  $i+=1
  message << rand(1..8)
end

puts "message"
p message

$y = []
$j = 0
def encrypt(message, e, n)
  while $j < message.length 
    $y << (message[$j] ** e) % n
    $j += 1
  end
end
encrypt(message, e, n)

puts "y"
p $y


$yx = []
$j = 0
def decrypt(priv1, n)
  while $j < $y.length
    $yx << ($y[$j] ** priv1[0]) % n
    $j += 1
  end
end
decrypt(priv1, n)

puts "yx"
p $yx

def hackurmann(n, primes)
  $i = 0
  while $i < primes.length
    $j = 0
    while $j < primes.length
      if (primes[$j]*primes[$i])==n
        puts "primes hackurr"
        p [primes[$j], primes[$i]]
        return
      end
      $j += 1
    end
    $i -= 1
  end
end

hackurmann(n, primes)


n = 11*13#primes[rand(1..primes.length-1)]*primes[rand(1..primes.length-1)]