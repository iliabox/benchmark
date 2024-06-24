import hashlib
import time

start = time.perf_counter()

array = {}
for i in range(1000000):
    array[i] = hashlib.sha256(str(i).encode()).hexdigest()

end = time.perf_counter()
print(f"Execution time: {(end - start) * 1000} milliseconds")
