
import random

def generate_workers(n=400):
    workers = []
    for i in range(1, n+1):
        worker = {
            "id": i,
            "name": f"Worker_{i}",
            "gender": random.choice(["Male", "Female"]),
            "salary": random.randint(5000, 35000)
        }
        workers.append(worker)
    return workers

def generate_payment_slips(workers):
    try:
        for worker in workers:
            salary = worker["salary"]
            gender = worker["gender"]
            level = "Unassigned"

            if salary > 10000 and salary < 20000:
                level = "A1"

            if salary > 7500 and salary < 30000 and gender == "Female":
                level = "A5-F"

            print("------ PAYMENT SLIP ------")
            print(f"Worker ID: {worker['id']}")
            print(f"Name: {worker['name']}")
            print(f"Gender: {gender}")
            print(f"Salary: ${salary}")
            print(f"Employee Level: {level}")
            print("--------------------------\n")

    except KeyError as e:
        print(f"Missing expected data field: {e}")
    except TypeError as e:
        print(f"Data type error encountered: {e}")
    except Exception as e:
        print(f"Unexpected error occurred: {e}")


if __name__ == "__main__":
    workers = generate_workers(400)
    generate_payment_slips(workers)
