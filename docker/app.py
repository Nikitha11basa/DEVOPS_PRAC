import time

# Simulate a long-running task (e.g., a service or process)
def long_running_task():
    while True:
        print("The application is running...")
        time.sleep(5)  # Sleep for 5 seconds to simulate work being done

# Start the task
if __name__ == "__main__":
    long_running_task()
