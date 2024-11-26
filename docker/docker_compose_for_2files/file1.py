# file1.py

def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

def print_primes():
    print("Prime numbers from 1 to 10:")
    for num in range(1, 11):
        if is_prime(num):
            print(num)

if __name__ == "__main__":
    print_primes()
