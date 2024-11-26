# file2.py

def factorial(n):
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def print_factorials():
    print("Factorials of numbers from 1 to 10:")
    for num in range(1, 11):
        print(f"{num}! = {factorial(num)}")

if __name__ == "__main__":
    print_factorials()
