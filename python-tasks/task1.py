def is_prime(num):
    if num in [0, 1]:
        return False

    count = 0
    for i in range(1, num//2):
        if num % i == 0:
            count += 1

    if count > 1: 
        return False 
    
    return True