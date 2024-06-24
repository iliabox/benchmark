import hashlib
import time

def sha256(data):
    return hashlib.sha256(data.encode()).hexdigest()

start = time.perf_counter()

array1 = {i: sha256(str(i)) for i in range(1000000)}

array2 = [hash_value[1:-1] for hash_value in array1.values()]

final_hash = sha256(''.join(array2))

print(f"Final hash: {final_hash}")

end = time.perf_counter()
duration = (end - start) * 1000

print(f"Execution time: {round(duration)} milliseconds")
